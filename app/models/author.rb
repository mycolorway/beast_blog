class Author < User
  include Authentication

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :posts
 end
