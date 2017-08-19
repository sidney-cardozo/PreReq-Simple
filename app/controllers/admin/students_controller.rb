class Admin::StudentsController < ApplicationController
  before_filter :authorize_admin, except: [:show]
  before_filter :authorized_to_view, only: [:show]

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
    params.require(:student).permit(:name, :email, :concentration, :industry, :resume_link, :image)
  end

  def authorized_to_view
    if current_user
      if @student = Student.find(params[:id])
        if @pair = Pair.find_by_student_id(params[:id]) || current_user.admin?
          redirect_to "/", notice: "Access Denied" unless current_user.admin? || current_user == User.find(@pair.applicant.user_id)
        else
          redirect_to :back, notice: "Student is not paired !"
        end
      else
        redirect_to :back, notice: "Student not existant !"
      end
    else
      redirect_to "/", notice: "Please login to continue !"
    end
  end

end
