class User < ApplicationRecord
  has_many :comments

  def author?
    false
  end
end
