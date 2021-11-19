class Region < ApplicationRecord
  validates :name, :province, :country, presence: true, uniqueness: true
  has_many :wines
end
