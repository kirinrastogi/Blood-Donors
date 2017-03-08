class RecipientsController < ApplicationController
  def show
    render json: Recipient.find(params[:id])
  end

  def index
    render json: Recipient.find_each
  end

  def affected
    render json: Donor.joins(:transactions => :recipient).where("transactions.donor_id=#{params[:id]}").select("*")
  end

  def create
  end
end
