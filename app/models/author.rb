class Author < ApplicationRecord
  include Authentication

  has_many :posts
 end
