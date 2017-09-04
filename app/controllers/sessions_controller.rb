class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      if user.applicant?
        if applicant = Applicant.find_by_user_id(user.id)
          redirect_to applicant_path(applicant.id)
        else
          redirect_to new_applicant_path
        end
      elsif user.employer?
        if employer = Employer.find_by_user_id(user.id)
          redirect_to employer_path(employer.id)
        else
          redirect_to new_employer_path
        end
      elsif user.admin?
        redirect_to admin_pairs_path
      end

    else
      redirect_to :back, notice: "Your email or password is incorrect. Please try again!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: "You've been logged out"
  end
end
