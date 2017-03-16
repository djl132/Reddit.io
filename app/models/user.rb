class User < ApplicationRecord


# set role to member by defualt if not explicitly set
before_save {self.role ||= :member}



has_many :posts, dependent: :destroy
has_many :comments, dependent: :destroy
has_many :votes, dependent: :destroy
has_many :favorites, dependent: :destroy
# has_many :topics, dependent: :destroy


  before_save {self.name =

              if name.present?
                arr = name.split(" ")
                arr.each do  |name|  name.capitalize! end
                arr.join(" ")
              end

                }

  before_save { self.email = email.downcase if email.present? }

# #3
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
# #4
 validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
 validates :password, length: { minimum: 6 }, allow_blank: true
# #5
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

# BCRYPT
  has_secure_password

  enum role: [:member, :admin]


  def favorite_for(post)
    favorites.where(post_id: post.id).first
  end

  def threads
    threads = []
    favorites.each do |topic|
      thread << favorite.topic
    end
    return threads
  end


  def avatar_url(size)
    gravatar_id = Digest::MD5::hexdigest(self.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end


  def favorite_posts
    arr = []
    favorites do |favorite|
      arr << favorite.post
    end
      return arr
  end


end
