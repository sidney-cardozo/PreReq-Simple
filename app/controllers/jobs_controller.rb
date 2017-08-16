class JobsController < ApplicationController

  include ApplicationHelper

  before_filter :authorized_to_changes, only: [:create, :delete_job]

  def index
    @jobs = Jobs.all.order(created_at: :desc)
  end

  def show
    if Employer.exists?(id: params[:employer_id]) && Job.exists?(id: params[:id])
      @job = Job.find(params[:id])
      @user = current_user
    else
      redirect_to "/", notice: "Employer or Job not existant"
    end
  end

  def delete_job
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to :back
  end

  def create
    employer = Employer.find(params[:employer_id])
    job = Job.employer.create(job_params)

    if job.save
      redirect_to jobs
    else
      redirect_to jobs
    end
  end

  private

  def job_params
    params.require(:job).permit(:position, :description, :requirements, :job_type, :apply_info)
  end

  def authorized_to_changes
    if current_user
      if Employer.exists?(id: params[:employer_id])
        redirect_to :back, notice: "Action Forbidden" unless is_owner(Employer, params[:employer_id], current_user)
      else
        redirect_to :back, notice: "Employer not existant"
      end
    else
      redirect_to :back, notice: "Action Forbidden"
    end
  end
end
