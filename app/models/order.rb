class Order < ApplicationRecord
  validates :subtotal, :gst, :pst, :hst, :total, presence: true, numericality: true
  belongs_to :customer
  belongs_to :status
  has_many :wine_orders
end
