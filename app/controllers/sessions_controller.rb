class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

    if user
      session[:user_id] = user.id

      if user.applicant?
        if applicant = Applicant.find_by_user_id(user.id)
          redirect_to "/applicants/#{applicant.id}"
        else
          redirect_to "/applicants/new"
        end
      elsif user.employer?
        if employer = Employer.find_by_user_id(user.id)
          redirect_to "/employers/#{employer.id}"
        else
          redirect_to "/employers/new"
        end
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
