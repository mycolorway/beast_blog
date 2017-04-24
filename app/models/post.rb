class Post < ApplicationRecord
  # the album feature is removed in current version
  enum category: { article: 0, album: 1 }

  belongs_to :author, optional: true

  has_many :comments
  has_many :photos
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates_uniqueness_of :slug, conditions: -> { where.not(slug: [nil, '']) }

  before_save :format_slug, :create_tags

  scope :tag_with, ->(tag_name) { joins(:tags).where("tags.name = ?", tag_name) }
  scope :published, -> { where(published: true) }
  scope :draft, -> { where(published: false) }

  def add_tags *tag_names
    tags.clear
    tag_names.each do |tag_name|
      tags << Tag.find_or_initialize_by(name: tag_name)
    end
  end

  def to_slug
    slug = self.slug
    return slug unless slug.present?

    slug.gsub! /['`]/,""
    slug.gsub! /[.`]/,""
    slug.gsub! /\s*@\s*/, " at "
    slug.gsub! /\s*&\s*/, " and "
    slug.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'
    slug.gsub! /_+/,"-"
    slug.gsub! /\A[_\.]+|[_\.]+\z/,""

    URI.encode slug
  end

  def abstract
    return '' unless self.content.present?

    # first p tag or first 100 words
    /<p>(.*?)<\/p>/.match(self.content).to_a.last || self.content.first(100)
  end

  def tag_string=(str)
    @tag_string = str
  end

  def tag_string
    @tag_string ||= tags.map(&:name).join(", ")
  end

  private

  def format_slug
    self.slug = self.to_slug
  end

  def create_tags
    add_tags *tag_string.split(',').map(&:strip)
  end

end
