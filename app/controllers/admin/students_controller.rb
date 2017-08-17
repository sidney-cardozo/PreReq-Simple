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

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to admin_pairs_path
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_pairs_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :concentration, :industry, :resume_link)
  end

end
