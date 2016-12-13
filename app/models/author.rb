class Author < User
  include Loginable

  validates :password, presence: true

  has_many :posts

  def author?
    true
  end

 end
