class WineriesController < ApplicationController
  def index
    @wineries = Winery.all.page(params[:page])
  end

  def show
    @winery = Winery.includes(:wines).find(params[:id])
  end
end
