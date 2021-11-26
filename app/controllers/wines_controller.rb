class WinesController < ApplicationController
  def index
    @wines = Wine.includes(:variety, :winery, :region).all
  end

  def show
    @wine = Wine.find(params[:id])
  end
end
