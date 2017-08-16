class ApplicantsController < ApplicationController

  before_filter :authorized_to_view_applicants, only: [:edit]

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
    redirect_to "/login" unless current_user && current_user.applicant? && Applicant.where(user_id: current_user.id).blank?

    @applicant = Applicant.new
  end

  def show
    if current_user
      redirect_to "/", notice: "User not an applicant" unless current_user.applicant? && current_user.applicant.blank? || current_user.admin?
    else
      redirect_to "/login", notice: "Not logged in"
    end

    puts "checkingtheparams"
    puts Applicant.find(params[:id])
    puts "done"
    if Applicant.exists?(id: params[:id])
      @applicant = Applicant.find(params[:id])
      @user = User.find(@applicant.user_id)
    else
      redirect_to :back, notice: "Applicant not existant"
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :phone_number, :description, :resume_link, :fields, :image)
  end

  def authorized_to_view_applicants
    if current_user
      if Applicant.exists?(id: params[:id])
        redirect_to "/", notice: "Action Forbidden" unless view_context.is_owner(Applicant, params[:id], current_user)
      else
        redirect_to "/", notice: "Applicant not existant"
      end
    else
      redirect_to "/", notice: "Action Forbidden"
    end
  end
end
