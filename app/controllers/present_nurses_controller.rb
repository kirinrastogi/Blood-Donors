class PresentNursesController < ApplicationController
  def show
    @present_nurse = PresentNurse.new(show_json)
  end

  def index
    render json: PresentNurse.last(10).reverse
  end

  def new
    @present_nurse = PresentNurse.new
  end

  def create
    @present_nurse = PresentNurse.new present_nurse_params
    @present_nurse.save!
    redirect_to @present_nurse
  rescue
    render 'new'
  end

  private

  def present_nurse_params
    params.require(:present_nurse).permit(:donation_id, :nurse_id)
  end

  def show_json
    PresentNurse.find(params[:id]).as_json
  end

  helper_method :show_json
end
