class ApplicantsController < ApplicationController

  # before_filter :authorized_to_changes

  def edit
    @applicant = Applicant.find_by_user_id(current_user)

  end

  def update
    @applicant = Applicant.find_by_user_id(current_user)
    @applicant.update(applicant_params)
    redirect_to applicant_path(@applicant)
    # try for updating this later
  end

  def create
    @applicant = Applicant.new(applicant_params)
    @applicant.user = current_user
    if @applicant.save
      redirect_to applicant_path(@applicant.id)
    else
      render :new
    end
  end

  def new
    @applicant = Applicant.new
  end

  def show
    @applicant = Applicant.find_by_user_id(current_user.id)

  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :phone_number, :description, :resume_link, :fields)
  end

  # def authorized_to_changes
  #   redirect_to '/', notice: "Action forbidden" unless Applicant.find_by_user_id(current_user.id) == params[:id]
  # end

end
