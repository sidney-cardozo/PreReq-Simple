class Admin::StudentsController < ApplicationController
  before_filter :authorize_admin

  def create
    student = Student.create(student_params)

    if student.save
      redirect_to admin_pairs_path
    else
      redirect_to admin_pairs_path
    end
  end

  def index
    @students = Student.all
  end

  def delete
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_pairs_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :concentration, :industry, :resume_link)
  end

end
