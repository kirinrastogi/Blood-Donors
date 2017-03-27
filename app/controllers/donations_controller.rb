class DonationsController < ApplicationController
  def show
    @donation = show_json params[:id]
  end

  def index
    render json: Donation.last(10).reverse
  end

  def donor
    @donations = donor_json params[:id]
  end

  def recipient
    @donations = recipient_json params[:id]
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

  def show_json(id)
    Donor.joins(:donations => :recipient)
      .where('donations.id = ?', id)
      .select(
    'donations.created_at', 
    'donations.id',
    'donations.recipient_id',
    'donations.donor_id',
    'recipients.name as recipient_name',
    'recipients.email as recipient_email',
    'donors.name as donor_name',
    'donors.email as donor_email'
    ).first.as_json
  end

  def donor_json(id)
    Donation
      .select(
        '*',
        'donations.created_at as date',
        'donations.id as donation_id'
      )
      .joins(:donor)
      .joins(:recipient)
      .where(donor_id: id)
  end

  def recipient_json(id)
    Donation
      .select(
        '*',
        'donations.created_at as date',
        'donations.id as donation_id'
      )
      .joins(:recipient)
      .joins(:donor)
      .where(recipient_id: id)
  end

  helper_method(:show_json, :donor_json, :recipient_json, :show_populated?)
end
