class DonorsController < ApplicationController
  def show
    @donor = Donor.new(show_json)
  end

  def index
    render json: Donor.last(10).reverse
  end

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.create donor_params
    redirect_to @donor
  rescue
    render 'new'
  end

  private

  def donor_params
    params.require(:donor).permit(:name, :email, :blood_type)
  end

  def show_json
    Donor.find(params[:id]).as_json
  end

  helper_method :show_json
end
