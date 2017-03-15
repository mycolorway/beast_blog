class User < ApplicationRecord
  has_many :comments
  has_many :authentications

  def author?
    false
  end

  class << self
    def authenticate auth
      locate_auth(auth) || create_user(auth)
    end

    def locate_auth auth
      Authentication.find_by_provider_and_uid(auth[:provider], auth[:uid]).try(:user)
    end


    def create_user auth
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

        user
      end
    end
  end
end
