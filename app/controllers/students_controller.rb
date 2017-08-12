class StudentsController < ApplicationController
  def create
    student = Student.create(student_params)

    if student.save
      redirect_to students
    else
      redirect_to students
    end
  end

  def index
    @students = Students.all
  end

  def delete
    @student = Students.find(params[:id])
    @student.destroy
    redirect_to students
  end

  private

  def student_params
    params.require(:student).permit(:name, :concentration, :industry, :resume_link)
  end

end
