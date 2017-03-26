class NursesController < ApplicationController
  def show
    @nurse = Nurse.new show_json
  end

  def index
    render json: Nurse.find_each
  end

  def new
    @nurse = Nurse.new
  end

  def create
    @nurse = Nurse.new nurse_params
    @nurse.save!
    redirect_to @nurse
  rescue
    render 'new'
  end

  private

  def nurse_params
    params.require(:nurse).permit(:name, :email)
  end

  def show_json
    Nurse.find(params[:id]).as_json
  end

  helper_method :show_json
end
