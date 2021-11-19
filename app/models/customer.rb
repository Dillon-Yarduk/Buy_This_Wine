class Customer < ApplicationRecord
  validates :name, :email, :password, presence: true
  validates :name, :email, uniqueness: true
  belongs_to :province
  has_many :orders
end
