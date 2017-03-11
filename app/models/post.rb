class Post < ApplicationRecord
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy

    # validation : use ACTIVERECORD (every model inherits from it)
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true


    default_scope { order('created_at DESC') }

    # create Querying methods using scope
        scope :ordered_by_title, -> {order ('title DESC')}
        scope :ordered_by_reverse_created_at, -> {order ('created_at ASC')}

end
