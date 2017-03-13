class Vote < ApplicationRecord


  after_save :update_post
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: {in: [1,-1], message: "%{value} is not valid vote."}, presence: true


  private

  def update_post
    post.update_rank
  end

end
