class RecipientsController < ApplicationController
  def show
    @recipient = show_json
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

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new recipient_params
    @recipient.save!
    redirect_to @recipient
  rescue
    render 'new'
  end

  private

  def show_json
    Recipient.find params[:id]
  end

  def recipient_params
    params.require(:recipient).permit(:after, :name, :email, :blood_type)
  end

  helper_method :show_json

end
