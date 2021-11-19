class Region < ApplicationRecord
  validates :name, :province, :country, presence: true
  validates :name, uniqueness: true
  has_many :wines
end
