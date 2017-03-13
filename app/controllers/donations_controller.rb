class DonationsController < ApplicationController
  def show
    @donation = show_json
  end

  def index
    render json: Donation.find_each
  end

  def donor
    render json: donor_json
  end

  def recipient
    render json: recipient_json
  end

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new(donation_params).save!
    redirect_to @donation
  rescue
    render 'new'
  end

  private

  def donation_params
    params.require(:donation).permit(:recipient_id, :donor_id)
  end

  def show_json
    Donor.joins(:donations => :recipient)
      .where('donations.id = ?', params[:id])
      .select(
    'donations.created_at', 
    'donations.id',
    'donations.recipient_id',
    'donations.donor_id',
    'recipients.name as recipient_name',
    'recipients.email as recipient_email',
    'donors.name as donor_name',
    'donors.email as donor_email'
    ).first

  end

  def donor_json
    Donation.includes(:donor).where(donor_id: params[:id])
  end

  def recipient_json
    Donation.includes(:recipient).where(recipient_id: params[:id])
  end

  helper_method(:show_json, :donor_json, :recipient_json)
end
