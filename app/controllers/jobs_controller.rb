class JobsController < ApplicationController

  include ApplicationHelper

  before_filter :authorized_to_changes, only: [:create, :delete_job]

  def index
    @employer = Employer.find(params[:employer_id])
    @jobs = @employer.jobs.order(created_at: :desc)
    @job = Job.new
  end

  def show
    # if Employer.exists?(params[:employer_id]) && Job.exists?(params[:id])
      @bookmark = Bookmark.new
      @job = Job.find(params[:id])
      @employer = @job.employer
    # else
    #   redirect_to "/", notice: "Employer or Job not existant"
    # end

  end

  def search_index
    @jobs = Job.search(params[:query])
    if params[:query]
      @query = true
      @jobs = Job.search(params[:query])
    else
      @query = false
      @jobs = Job.all.order('updated_at DESC')
    end
  end

  def edit
    @job = Job.find(params[:id])
    @employer = @job.employer
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to job_path(@job)
    # try for updating this later
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    respond_to do |format|
      format.html { redirect_to :back}
      format.js
    end
  end

  def create
    employer = Employer.find(params[:employer_id])
    job = employer.jobs.new(job_params)

    if job.save
      redirect_to employer_jobs_path
    else
      redirect_to :back
    end
  end

  def new
    @job = Job.new
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
