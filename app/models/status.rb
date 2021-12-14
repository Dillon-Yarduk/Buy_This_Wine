class Status < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :orders, dependent: nil
end
