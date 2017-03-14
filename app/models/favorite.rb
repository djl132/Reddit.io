class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post
  # belongs_to :topic

  # after_save :update_thread




end
