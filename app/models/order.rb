class Order < ApplicationRecord
  validates :subtotal, :gst, :pst, :hst, :total, numericality: true
  belongs_to :customer
  belongs_to :status
  has_many :wine_orders
  has_many :wines, through: :wine_orders
end
