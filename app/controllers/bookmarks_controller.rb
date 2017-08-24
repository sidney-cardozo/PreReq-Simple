class BookmarksController < ApplicationController

  def create
    @job = Job.find(params[:job_id])
    bookmark = Bookmark.new(job_id: params[:job_id], applicant_id: current_user.applicant.id)
    bookmark.save

    respond_to do |format|
      format.html { redirect_to job_path(@job.id)}
      format.js
    end

  end

  def destroy
    @job = Job.find(params[:job_id])
    bookmark = Bookmark.find_by_job_id(params[:job_id])
    bookmark.destroy

    respond_to do |format|
      format.html { redirect_to job_path(@job.id)}
      format.js
    end

  end

  def index
    @bookmarks = Bookmark.where(applicant_id: current_user.applicant.id )
    @jobs = Job.where(id: @bookmarks.job_id)
  end

end
