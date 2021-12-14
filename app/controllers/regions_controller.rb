class RegionsController < ApplicationController
  def index
    @regions = Region.all.page(params[:page])
  end

  def show
    @region = Region.includes(:wines).find(params[:id])
  end
end
