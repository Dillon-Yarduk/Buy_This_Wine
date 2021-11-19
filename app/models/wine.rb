class Wine < ApplicationRecord
  belongs_to :winery
  belongs_to :variety
  belongs_to :region
end
