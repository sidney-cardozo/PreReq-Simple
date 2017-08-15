class EmployersController < ApplicationController

  # before_filter :authorized_to_changes, only: [:edit]

  def edit
    @employer_id = current_user.id
    employer_user = User.find(@employer_id)
    employer = Employer.find_by_user_id (employer_id)

    if employer_user
      if !employer
        new_employer = employer_user.create!(employer_params)
      else
        Employer.update(employer.id, employer_params)
      end
    end
  end

   def create
    @employer = Employer.new(employer_params)
    @employer.user = current_user
    if @employer.save
      redirect_to employer_path(@employer.id), notice: "Employer profile saved"
    else
      render :new, error: "Couldnt save employer profile"
    end
  end




  def new
    @employer = Employer.new
  end

  def show
    @employer = Employer.find_by_user_id(current_user.id)

  end


  private

  def employer_params
    params.require(:employer).permit(:name, :description, :icon_url)
  end

  # def authorized_to_changes
  #   redirect_to '/', notice: "Action forbidden" unless current_user.id == params[:id]
  # end

end
