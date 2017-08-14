class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:role] = @user.role

      if @user.applicant
        redirect_to "/applicant/#{@user.id}"
      elsif @user.employer
        redirect_to "/employer/#{@user.id}"
      elsif @user.admin
        redirect_to "/admin/students"
      end

      redirect_to '/'
    else
      redirect_to :back
    end
  end

  def welcome

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end

