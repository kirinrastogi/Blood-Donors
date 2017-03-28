class PresentNursesController < ApplicationController
  def index
    render json: PresentNurses.last(10).reverse
  end
end
