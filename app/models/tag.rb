class Tag < ApplicationRecord
  POPULAR_TAG_SIZE = 20

  has_many :taggings
  has_many :posts, through: :taggings

  validates :name, presence: true, uniqueness: true

  scope :popular, -> do
    select("tags.id, tags.name, count(taggings.id) AS taggings_count").
      joins(:taggings).group('tags.id').
      order('taggings_count DESC').limit(POPULAR_TAG_SIZE)
  end
end
