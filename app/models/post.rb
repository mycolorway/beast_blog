class Post < ApplicationRecord
  belongs_to :author, optional: true

  has_many :comments

  validates :slug, presence: true, uniqueness: true

  before_save :format_slug


  def to_slug
    slug = self.slug
    slug.gsub! /['`]/,""
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "
    slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
    slug.gsub! /_+/,"-"
    slug.gsub! /\A[_\.]+|[_\.]+\z/,""

    slug
  end

  private

  def format_slug
    self.slug = self.to_slug
  end
end
