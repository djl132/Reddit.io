class Topic < ApplicationRecord
  has_many :posts, dependent: :destroy

  # validation : use ACTIVERECORD (every model inherits from it)
  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true

end
