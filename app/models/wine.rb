class Wine < ApplicationRecord
  paginates_per 15
  has_one_attached :image
  validates :name, :description, :price, presence: true
  validates :price, numericality: true
  belongs_to :winery
  belongs_to :variety
  belongs_to :region
  has_many :wine_orders
  has_many :orders, through: :wine_orders
end
