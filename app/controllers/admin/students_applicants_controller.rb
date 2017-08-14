class StudentsApplicantsController < ApplicationController
  def create
    pair = StudentsApplicants.new(pair_params)

    if pair.save
      Students.update(params[:student_id], paired: true)
      Applicants.update(params[:applicant_id], paired: true)
      redirect_to students_applicants
    else
      redirect_to students_applicants
    end
  end

  def remove_pair
    @student_applicant = StudentsApplicants.find(params[:students_applicant_id])
    @student_applicant.destroy
    redirect_to students_applicants
  end

  def edit
    @pair = StudentsApplicants.find(params[:students_applicant_id])

    if @pair
      StudentsApplicants.update(params[:students_applicant_id], story: params[:story])
    else
      redirect_to students_applicants
    end
  end

  def show
    @pair = StudentsApplicants.find(params[:id])
  end


  private

  def pair_params
    params.require(:student_applicant).permit(:student_id, :applicant_id)
  end
end
