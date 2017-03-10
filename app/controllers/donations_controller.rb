class DonationsController < ApplicationController
  def show
    render json: 
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
      )
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

  def new
    @donation = Donation.new
  end

  def create
    @donation = Donation.new donor_params
    Donation.validate!(params)
    @donation.save!
    redirect_to @donation
  rescue
    render 'new'
  end

  private

  def donation_params
    params.require(:donation)
  end
end
