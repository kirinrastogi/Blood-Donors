class RecipientsController < ApplicationController
  def show
    render json: Recipient.find(params[:id])
  end

  def index
    render json: Recipient.find_each
  end

  def affected
    render json: Donor.find_by_sql("select * from donors join transactions on transactions.donor_id=donors.id join recipients on transactions.recipient_id=recipients.id where transactions.donor_id=#{params[:id]};")
  end

  def create
  end
end
