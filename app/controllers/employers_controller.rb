class EmployersController < ApplicationController
  def edit
    @employer_id = current_user.user_id
    employer_user = Users.find(@employer_id)
    employer = Employers.where(user_id: employer_id).first

    if employer_user
      if !employer
        new_employer = employer_user.create!(employer_params)
      else
        Employer.update(employer.id, employer_params)
      end
    end
  end

  private

  def employer_params
    params.require(:employer).permit(:name, :description, :icon_url)
  end
end
