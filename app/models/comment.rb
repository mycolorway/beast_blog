class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true

  def can_delete_by user
    user.author? || self.user == user
  end
end
