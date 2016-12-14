class Photo < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # validates :photo, presence: true, file_size: { less_than: 30.megabytes }

  belongs_to :post

  before_save :set_photo_attributes

  private

  def set_photo_attributes
    if photo.present? && photo_changed?
      self.content_type = photo.file.content_type
      self.file_size = photo.file.size
      self.file_name = photo.file.original_filename
    end
  end
end
