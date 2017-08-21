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
    redirect_to admin_student_path
  end

  def show
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_pairs_path
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :concentration, :industry, :resume_link, :image)
  end

end
