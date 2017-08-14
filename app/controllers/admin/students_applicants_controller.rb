class StudentsApplicantsController < ApplicationController

  before_filter :signed_in?, :is_admin?

  def create
    pair = StudentsApplicant.new(pair_params)

    if pair.save
      Student.update(params[:student_id], paired: true)
      Applicant.update(params[:applicant_id], paired: true)
      redirect_to students_applicants, notice: "Pair Created !"
    else
      redirect_to students_applicants
    end
  end

  def remove_pair
    @student_applicant = StudentsApplicant.find(params[:students_applicant_id])
    if @student_applicant
      @student_applicant.destroy
      redirect_to students_applicants, notice: "Pair deleted!"
    else
      redirect_to students_applicants, notice: "Couldnt find pair, make sure the id's are correct!"
  end

  def edit
    @pair = StudentsApplicant.find(params[:students_applicant_id])

    if @pair
      StudentsApplicant.update(params[:students_applicant_id], story: params[:story])
    else
      redirect_to students_applicants
    end
  end

  def show
    @pair = StudentsApplicant.find(params[:id])
  end


  private

  def pair_params
    params.require(:student_applicant).permit(:student_id, :applicant_id)
  end
end
