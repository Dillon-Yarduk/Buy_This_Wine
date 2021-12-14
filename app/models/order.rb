class Order < ApplicationRecord
  validates :subtotal, :gst, :pst, :hst, :total, numericality: true
  belongs_to :customer
  belongs_to :status
  has_many :wine_orders, dependent: :restrict_with_exception
  has_many :wines, through: :wine_orders, dependent: nil
end
