class Post < ApplicationRecord
  belongs_to :author, optional: true

  has_many :comments

  validates :slug, presence: true, uniqueness: true

  before_save :format_slug


  def to_slug
    slug = self.slug

    #blow away apostrophes
    slug.gsub! /['`]/,""

    # @ --> at, and & --> and
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with underscore
    slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'

    #convert double underscores to single
    slug.gsub! /_+/,"-"

    #strip off leading/trailing underscore
    slug.gsub! /\A[_\.]+|[_\.]+\z/,""

    slug
  end

  private

  def format_slug
    self.slug = self.to_slug
  end
end
