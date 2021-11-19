class Variety < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :wines
end
