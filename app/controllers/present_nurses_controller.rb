class PresentNursesController < ApplicationController
  def show
    @present_nurse = show_json
  end

  def index
    render json: PresentNurse.last(10).reverse
  end

  def new
    @present_nurse = PresentNurse.new
  end

  def create
    @present_nurse = PresentNurse.create present_nurse_params
    redirect_to @present_nurse
  rescue
    render 'new'
  end

  private

  def present_nurse_params
    params.require(:present_nurse).permit(:donation_id, :nurse_id)
  end

  def show_json
    Nurse.joins(:present_nurses => :donation)
      .where('present_nurses.id = ?', params[:id])
      .select(
        'present_nurses.created_at', 
        'present_nurses.id',
        'present_nurses.nurse_id',
        'present_nurses.donation_id',
        'nurses.name as nurse_name',
        'nurses.email as nurse_email',
        'donations.donor_id as donor_id',
        'donations.recipient_id as recipient_id'
      )
      .first
      .as_json
  end

  helper_method :show_json
end
