class EmployersController < ApplicationController

  before_filter :authorized_to_view_employers, only: [:edit]

  def edit
    @employer = Employer.find_by_user_id(current_user)

  end

  def update
    @employer = Employer.find_by_user_id(current_user)
    @employer.update(employer_params)
    redirect_to employer_path(@employer)
    # try for updating this later
  end

   def create
    @employer = Employer.new(employer_params)
    @employer.user = current_user
    if @employer.save
      redirect_to employer_path(@employer.id), notice: "Employer profile saved"
    else
      render :new, error: "Couldn't save employer profile"
    end
  end




  def new
    if current_user
      redirect_to "/", notice: "User not an employer" unless current_user.employer? && current_user.blank? || current_user.admin?
    else
      redirect_to "/login", notice: "Not logged in"
    end

    @employer = Employer.new
  end

  def show
    if Employer.exists?(params[:id])
      @employer = Employer.find(params[:id])
      @user = User.find(@employer.user_id)
    else
      redirect_to "/", notice: "Employer not existant"
    end
  end


  private

  def employer_params
    params.require(:employer).permit(:name, :description, :image)
  end

  def authorized_to_view_employers
    if current_user
      if Employer.exists?(id: params[:id])
        redirect_to "/", notice: "Action Forbidden" unless view_context.is_owner(Employer, params[:id], current_user)
      else
        redirect_to "/", notice: "Employer not existant"
      end
    else
      redirect_to "/", notice: "Action Forbidden"
    end
  end
end
