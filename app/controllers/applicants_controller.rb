class ApplicantsController < ApplicationController
  def edit
    @applicant_id = current_user.user_id
    applicant_user = Users.find(@applicant_id)
    applicant = Applicants.where(user_id: @applicant_id).first

    if applicant_user
      if !applicant
        new_applicant = applicant_user.create(applicant_params)
      else
        applicant.update(applicant.id, applicant_params)
      end
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:first_name, :last_name, :phone_number, :description, :resume_link, :fields)
  end
end
