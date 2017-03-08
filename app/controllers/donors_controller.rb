class DonorsController < ApplicationController
  def show
    render json: Donor.find(params[:id])
  end

  def index
    render json: Donor.find_each
  end

  def create
  end
end
