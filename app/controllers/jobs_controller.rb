class JobsController < ApplicationController
  def index
    @jobs = Jobs.all.order(created_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
    @user = current_user
  end

  def delete_job
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to :back
  end

  def create
    employer = Employer.find(params[:employer_id])
    job = Job.employer.new(job_params)

    if job.save
      redirect_to employer_jobs_path
    else
      redirect_to new_employer_job
    end
  end

  def new
    @job = Job.new
  end

  private

  def job_params
    params.require(:job).permit(:position, :description, :requirements, :job_type, :apply_info)
  end
end
