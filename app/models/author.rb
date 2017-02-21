class Author < User
  include Loginable

  validates :email, presence: true, uniqueness: true

  validates :password, presence: true

  has_many :posts

  def author?
    true
  end

 end
