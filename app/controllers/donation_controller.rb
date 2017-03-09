class DonationController < ApplicationController
  def show
    render json: Transaction.find(params[:id])
  end

  def index
    render json: Transaction.find_each
  end

  def donor
    render json: Transaction.includes(:donor).where(donor_id: params[:id])
  end

  def recipient
    render json: Transaction.includes(:recipient).where(recipient_id: params[:id])
  end

  def create
  end
end
