class Session
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :user, :omniauth, :email, :password

  validates :email, presence: true, unless: :omniauth
  validates :password, presence: true, unless: :omniauth
  validate :auth_user

  def initialize(attributes = {})
    self.attributes = attributes
  end

  def attributes=(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def save
    user if valid?
  end

  private

  def auth_user
    if omniauth.present?
      self.user = User.authenticate omniauth
    else
      self.user = Author.authenticate email, password
    end

    if self.user.blank?
      errors.add :custom, I18n.t('activemodel.errors.models.session.not_matched')
    end
  end
end
