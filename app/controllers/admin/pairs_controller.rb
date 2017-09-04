class Admin::PairsController < ApplicationController
  before_filter :authorize_admin

  def index
    @students = Student.where(paired: false).order(:first_name)
    @applicants = Applicant.where(paired: false).order(:first_name)
    @pairs = Pair.all
    @pair = Pair.new
  end


  def create
    pair = Pair.new(pair_params)

    if !pair.student.paired && !pair.applicant.paired && pair.save
      pair.student.update(paired: true)
      pair.applicant.update(paired: true)

      # NotificationMailer.notification_mail(pair).deliver

      redirect_to admin_pairs_path, notice: "Pair Created !"
    else
      redirect_to admin_pairs_path, error: "Pair was not created!"
    end
  end

  def destroy
    @pair = Pair.find(params[:id])
    @students = Student.where(paired: false).order(:first_name)
    @applicants = Applicant.where(paired: false).order(:first_name)
    @pair.student.update(paired: false)
    @pair.applicant.update(paired: false)
    @pair.destroy

    respond_to do |format|
      format.html { redirect_to admin_pairs_path }
      format.js   { }
    end

    # if @pair
    #   @pair.destroy
      # redirect_to admin_pairs_path, alert: "Pair deleted!"
    # else
      # redirect_to admin_pairs_path, notice: "Couldnt find pair, make sure the id's are correct!"
    # end
  end

  def edit
    @pair = Pair.find(params[:id])
  end

  def show
    @pair = Pair.find(params[:id])
  end

  def update
    @pair = Pair.find(params[:id])
    @pair.update(pair_params)

    if @pair.save
      redirect_to admin_pairs_path, notice: "Story saved !"
    else
      redirect_to :back, notice: "Story too long !"
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:paired)
  end

  def student_params
    params.require(:student).permit(:paired)
  end

  def pair_params
    params.require(:pair).permit(:student_id, :applicant_id, :story, :story_on_display)
  end
end
