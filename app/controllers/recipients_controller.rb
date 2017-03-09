class RecipientsController < ApplicationController
  def show
    render json: Recipient.find(params[:id])
  end

  def index
    render json: Recipient.find_each
  end

  def affected
    where = "donations.donor_id=#{params[:id]}"
    where += params[:after] ? " AND donation_date > #{params[:after]}" : ""
    render json: Donor.joins(:donations => :recipient).select("*", "donations.created_at as donation_date").where(where)
  end

  def create
  end

  private
  
  def recipient_params
    params.require(:recipient).permit(:id, :after)
  end
end
