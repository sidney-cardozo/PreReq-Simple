class StudentsController < ApplicationController

  before_filter :signed_in?, :is_admin?

  def create
    student = Student.create(student_params)

    if student.save
      redirect_to students
    else
      redirect_to students
    end
  end

  def index
    @students = Student.all
  end

  def delete
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students
  end

  private

  def student_params
    params.require(:student).permit(:name, :concentration, :industry, :resume_link)
  end

end
