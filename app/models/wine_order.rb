class WineOrder < ApplicationRecord
  validates :quantity, :price, presence: true
  validates :price, numericality: true
  validates :quantity, numericality: { only_integer: true }
  belongs_to :wine
  belongs_to :order
end
