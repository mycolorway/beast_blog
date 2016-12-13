class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true

  has_many :comments
  has_many :authentications

  def author?
    false
  end

  class << self
    def authenticate auth
      user = Authentication.find_by_provider_and_uid(auth[:provider],
                                                     auth[:uid]).try(:user)
      return user if user
      ActiveRecord::Base.transaction do
        user = User.create(
          name: auth[:info][:name],
          email: auth[:info][:email],
          bio: auth[:info][:bio],
          avatar: auth[:info][:image])

        user.authentications.create(
          provider:  auth[:provider],
          uid: auth[:uid],
          token: auth.credentials.try(:token))
      end

      user
    end
  end
end
