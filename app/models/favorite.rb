class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # after_save :update_thread




end
