class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      session[:role] = user.role

      if user.applicant?
        redirect_to "/applicants/#{user.id}"
      elsif user.employer?
        redirect_to "/employers/#{user.id}"
      elsif user.admin?
        redirect_to "/admin/students"
      end

    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
