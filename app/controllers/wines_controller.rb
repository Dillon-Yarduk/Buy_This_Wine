class WinesController < ApplicationController
  def index
    @wines = Wine.includes(:variety, :winery, :region).page(params[:page])
  end

  def show
    @wine = Wine.find(params[:id])
  end
end
