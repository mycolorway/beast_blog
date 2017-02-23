class Invitation < ApplicationRecord

  VALID_TIME_INTERVAL = 3.hours

  validates :code, :valid_before, :email, :name, presence: true
  validates_uniqueness_of :code

  belongs_to :author, class_name: 'Author', foreign_key: 'author_id', optional: true

  before_validation :init

  class << self

    def active code:, data: {}
      invitation = where(code: code).first
      if invitation.available?
        invitation.active data
      else
        false
      end
    end
  end

  def active data
    password = data.fetch('password')

    ActiveRecord::Base.transaction do
      author = Author.create name: self.name, email: self.email, password: password
      self.update_attributes author_id: author.id, used: true
    end
  end

  def available?
    unused? && expired?
  end


  private

  def unused?
    !used
  end

  def expired?
    Time.current < self.valid_before
  end

  def init
    set_code if self.code.blank?
    set_valid_before if self.valid_before.blank?
  end

  def set_code
    begin
      self.code = SecureRandom.hex
    end while Invitation.where(code: self.code).any?
  end

  def set_valid_before
    self.valid_before = Time.current + VALID_TIME_INTERVAL
  end
end
