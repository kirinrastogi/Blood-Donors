class TransactionsController < ApplicationController
  def show
    render json: Transaction.find(params[:id])
  end

  def index
    render json: Transaction.find_each
  end

  def create
  end
end
