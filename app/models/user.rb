class User < ApplicationRecord


# set role to member by defualt if not explicitly set
before_save {self.role ||= :member}

has_many :posts

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


end
