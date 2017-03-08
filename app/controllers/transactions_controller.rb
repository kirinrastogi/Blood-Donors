class TransactionsController < ApplicationController
  def show
    render json: Transaction.find(params[:id])
  end

  def index
    render json: Transaction.find_each
  end

  def donor
    render json: Donor.find_by_sql("select * from donors join transactions on transactions.donor_id=donors.id where donors.id=#{params[:id]};")
  end

  def create
  end
end
