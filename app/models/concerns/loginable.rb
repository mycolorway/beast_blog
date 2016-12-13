module Loginable
  extend ActiveSupport::Concern

  class_methods do

    def authenticate email, pass
      author = Author.find_by_email email
      return author if author && secure_compare(Digest::SHA256.hexdigest(pass + author.salt), author.hashed_password)
      false
    end

    def secure_compare(a, b)
      return false if a.blank? || b.blank? || a.bytesize != b.bytesize
      l = a.unpack "C#{a.bytesize}"

      res = 0
      b.each_byte { |byte| res |= byte ^ l.shift }
      res == 0
    end

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

  def password_salt
    @password_salt ||= Array.new(10){rand(1024).to_s(36)}.join
  end

  def generate_password pass
    self.salt, self.hashed_password =
      password_salt, Digest::SHA256.hexdigest(pass + password_salt)
  end

end
