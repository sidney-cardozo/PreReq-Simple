class PairsController < ApplicationController
  before_filter :authorize_admin

  def index
    @students = Student.all
    @applicants = Applicant.all
    @pairs = Pair.all
  end


  def create
    pair = Pair.new(pair_params)

    if pair.save
      Student.update(params[:student_id], paired: true)
      Applicant.update(params[:applicant_id], paired: true)
      redirect_to students_applicants, notice: "Pair Created !"
    else
      redirect_to students_applicants, error: "Pair was not created!"
    end
  end

  def remove_pair
    @student_applicant = Pair.find(params[:students_applicant_id])
    if @student_applicant
      @student_applicant.destroy
      redirect_to students_applicants, alert: "Pair deleted!"
    else
      redirect_to students_applicants, notice: "Couldnt find pair, make sure the id's are correct!"
  end

  def edit
    @pair = Pair.find(params[:students_applicant_id])

    if @pair
      Pair.update(params[:students_applicant_id], story: params[:story]), notice: "Pair story updated!"
    else
      redirect_to students_applicants, error: "Couldnt find pair, make sure the id's are correct!"
    end
  end

  def show
    @pair = Pair.find(params[:id])
  end


  private

  def pair_params
    params.require(:student_applicant).permit(:student_id, :applicant_id)
  end
end
