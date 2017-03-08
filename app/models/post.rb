class Post < ApplicationRecord
    belongs_to :topic
    has_many :comments, dependent: :destroy

    # validation : use ACTIVERECORD (every model inherits from it)
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
end
