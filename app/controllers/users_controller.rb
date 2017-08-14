class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.applicant?
        redirect_to "/applicants/#{@user.id}"
      elsif @user.employer?
        redirect_to "/employers/#{@user.id}"
      end
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

