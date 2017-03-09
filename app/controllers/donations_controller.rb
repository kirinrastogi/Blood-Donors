class DonationsController < ApplicationController
  def show
    render json: Donation.find(params[:id])
  end

  def index
    render json: Donation.find_each
  end

  def donor
    render json: Donation.includes(:donor).where(donor_id: params[:id])
  end

  def recipient
    render json: Donation.includes(:recipient).where(recipient_id: params[:id])
  end

  def create
  end
end
