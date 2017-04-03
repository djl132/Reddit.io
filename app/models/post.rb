class Post < ApplicationRecord
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy

    # validation : use ACTIVERECORD (every model inherits from it)
    validates :title, length: { minimum: 5 }, presence: true
    validates :body, length: { minimum: 20 }, presence: true
    validates :topic, presence: true
    validates :user, presence: true


    after_create :initiate_owner_notify

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

# have creator of post follow post
    def initiate_owner_notify
      Favorite.create!(post:self, user: self.user)
      FavoriteMailer.new_post(self.user, self).deliver_now
    end

    default_scope { order('rank DESC') }






# gets all public posts using a query metho
# IS THIS A CASE WEHRE THE JOIN TABLE CREATED BY THE INDEX IS USED? LOLS YEAH NOPE I'M STILL CONFUSED. BUT ESSENTIALLY IT'S RETRIEV
# HOW IS HTIS AN INNER JOIN, THOUGH?

scope :visible_to, -> (user) {user  ? all : joins(:topic).where('topic.public'  => true)}
# scope :favorited_by, -> (user) {user  ? find_by('favorite.user' => user) : nil}

end
