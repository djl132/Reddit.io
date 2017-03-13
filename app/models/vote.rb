class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: {in: [1,-1], message: "%{value} is not valid vote."}, presence: true
end
