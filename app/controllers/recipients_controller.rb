class RecipientsController < ApplicationController
  def show
    @recipient = Recipient.new(show_json)
  end

  def index
    render json: Recipient.last(10).reverse
  end

  def affected
    @recipients = affected_json
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.create recipient_params
    redirect_to @recipient
  rescue
    render 'new'
  end

  private

  def show_json
    Recipient.find(params[:id]).as_json
  end

  def affected_json
    after = params[:after] || 0
    Donor.joins(:donations => :recipient)
      .select(
        '*',
        'donations.created_at as donation_date'
      ).where(
        'donations.donor_id = :id AND donations.created_at >= :after',
        id: params[:id],
        after: after
      ).as_json
  end

  def recipient_params
    params.require(:recipient).permit(:after, :name, :email, :blood_type)
  end

  helper_method :show_json, :affected_json
end
