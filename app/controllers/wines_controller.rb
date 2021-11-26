class WinesController < ApplicationController
  def index
    @wines = Wine.includes(:variety, :winery, :region).page(params[:page])
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    variety_id = params[:variety_id]
    @wines = Wine.where("name LIKE ? OR description LIKE ?", wildcard_search, wildcard_search)
    unless variety_id.empty?
      @wines = @wines.where("variety_id = ?", variety_id)
    end
  end
end
