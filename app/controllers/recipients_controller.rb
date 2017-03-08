class RecipientsController < ApplicationController
  def show
    render json: Recipient.find(params[:id])
  end

  def index
    render json: Recipient.find_each
  end

  def create
  end
end
