class Admin::PairsController < ApplicationController
  before_filter :authorize_admin

  def index
    @students = Student.all
    @applicants = Applicant.all
    @pairs = Pair.all
    @pair = Pair.new
  end


  def create
    pair = Pair.new(pair_params)

    if pair.save
      Student.update(params[:student_id], paired: true)
      Applicant.update(params[:applicant_id], paired: true)
      redirect_to admin_pairs_path, notice: "Pair Created !"
    else
      redirect_to admin_pairs_path, error: "Pair was not created!"
    end
  end

  def destroy
    @pair = Pair.find(params[:id])
    if @pair
      @pair.destroy
      redirect_to admin_pairs_path, alert: "Pair deleted!"
    else
      redirect_to admin_pairs_path, notice: "Couldnt find pair, make sure the id's are correct!"
    end
  end

  # def edit
  #   @pair = Pair.find(params[:id])

  #   if @pair
  #     Pair.update(pair_params), notice: "Pair story updated!"
  #   else
  #     redirect_to admin_pairs_path, error: "Couldnt find pair, make sure the id's are correct!"
  #   end
  # end

  def show
    @pair = Pair.find(params[:id])
  end


  private

  def pair_params
    params.require(:pair).permit(:student_id, :applicant_id, :story)
  end
end
