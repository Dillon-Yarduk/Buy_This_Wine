class Province < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :gst, :pst, :hst, numericality: true
  has_many :customers
end
