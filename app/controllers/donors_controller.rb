class DonorsController < ApplicationController
  def show
    render json: Donor.find(params[:id])
  end

  def index
    render json: Donor.first(10)
  end

  def create
  end
end
