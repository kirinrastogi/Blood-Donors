class RecipientsController < ApplicationController
  def show
    render json: Recipient.find(params[:id])
  end

  def index
    render json: Recipient.find_each
  end

  def affected
    after = params[:after] || 0
    render json: 
      Donor.joins(:donations => :recipient)
      .select('*', 'donations.created_at as donation_date')
      .where(
        'donations.donor_id = :id AND donation_date >= :after',
        id: params[:id],
        after: after
      )
  end

  def create
  end

  private

  def recipient_params
    params.require(:recipient).permit(:after)
  end
end
