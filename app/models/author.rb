class Author < ApplicationRecord
  has_many :posts

  def self.authenticate email, pass
    author = Author.find_by_email email
    return author if author && Digest::SHA256.hexdigest(pass + author.salt) == author.hashed_password
    false
  end

  def password
    @password
  end

  def password=(pass)
    return unless pass
    @password = pass
    generate_password pass
  end

  private

  def generate_password pass
    self.salt, self.hashed_password =
      password_salt, Digest::SHA256.hexdigest(pass + password_salt)
  end

  def password_salt
    @password_salt ||= Array.new(10){rand(1024).to_s(36)}.join
  end
end
