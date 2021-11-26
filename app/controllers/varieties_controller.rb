class VarietiesController < ApplicationController
  def index
    @varieties = Variety.all.page(params[:page])
  end

  def show
    @variety = Variety.includes(:wines).find(params[:id])
  end
end