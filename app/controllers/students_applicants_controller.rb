class StudentsApplicantsController < ApplicationController
  def create
    pair = StudentsApplicants.create(pair_params)

    if pair.save
      redirect_to students_applicants
    else
      redirect_to students_applicants
    end
  end

  def remove_pair
    @student_applicant = StudentsApplicants.find(params[:students_applicant_id])
    redirect_to students_applicants
  end

  private

  def pair_params
    params.require(:pair).permit(:student_id, :applicant_id)
  end
end
