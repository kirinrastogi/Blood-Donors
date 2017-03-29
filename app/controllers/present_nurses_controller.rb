class PresentNursesController < ApplicationController
  def show
    render json: PresentNurse.new(show_json)
  end

  def index
    render json: PresentNurse.last(10).reverse
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
