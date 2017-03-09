class RecipientsController < ApplicationController
  def show
    render json: Recipient.find(params[:id])
  end

  def index
    render json: Recipient.find_each
  end

  def affected
    render json: Donor.joins(:donations => :recipient).where("donations.donor_id=#{params[:id]}").select("*", "donations.created_at as donation_date")
  end

  def create
  end

  private
  
  def recipient_params
    params.require(:recipient).permit(:id)
  end
end
