class PresentNursesController < ApplicationController
  def index
    render json: PresentNurse.last(10).reverse
  end
end
