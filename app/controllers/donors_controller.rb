class DonorsController < ApplicationController
  def show
    render json: Donor.find(params[:id])
    #render json: Donor.find_by_sql("select * from donors join transactions on transactions.donor_id=donors.id join recipients on recipients.id=transactions.donor_id where donors.id=#{params[:id]};")
  end

  def index
    render json: Donor.find_each
  end

  def create
  end
end
