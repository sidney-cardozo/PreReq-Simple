class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.applicant?
        redirect_to new_applicant_path
      elsif @user.employer?
        redirect_to new_employer_path
      end
    else
      redirect_to :back, notice: "Please verify your register informations"
    end
  end

  def welcome

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

end

