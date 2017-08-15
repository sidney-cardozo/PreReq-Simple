class ApplicantsController < ApplicationController

  # before_filter :authorized_to_changes

  def edit
    @applicant_id = current_user.id
    applicant_user = User.find(@applicant_id)
    applicant = Applicant.where(user_id: @applicant_id).first

    if applicant_user
      if !applicant
        new_applicant = applicant_user.create(applicant_params)
      else
        Applicant.update(applicant.id, applicant_params)
      end
    end
  end

  def new
    applicant_user = User.find(current_user.id)
    # applicant = applicant_user.applicants.create(applicant_params)

    # if applicant.save
    #   redirect_to "/search", notice: "Profile Creation successful !"
    # else
    #   redirect_to :back, notice: "Profile Creation failed !"
    # end
  end

  def show
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :phone_number, :description, :resume_link, :fields)
  end

  # def authorized_to_changes
  #   redirect_to '/', notice: "Action forbidden" unless Applicant.find_by_user_id(current_user.id) == params[:id]
  # end

end
