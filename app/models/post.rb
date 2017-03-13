class Post < ApplicationRecord

  after_create :create_vote

    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    # validation : use ACTIVERECORD (every model inherits from it)
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true

    default_scope { order('rank DESC')}



    # METHODS FOR GETTING ATTRIBUTE VALUES, such as NUMBER OF UPVOTES AND DOWNVOTES

    def up_votes
      votes.where(value: 1).count
    end

    def down_votes
      votes.where(value: -1).count
    end

    def points
      votes.sum(:value)
    end


    def update_rank
        age_in_days = (created_at - Time.new(1970,1,1))/1.day.seconds
        new_rank = points + age_in_days
        update_attribute(:rank, new_rank)
    end

    private

    def create_vote
      user.votes.create!(value:1, post: self)
    end
# retrieve latest posts first



end
