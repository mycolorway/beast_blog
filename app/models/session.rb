class Session < ActiveType::Object
  attr_accessor :user
  attr_accessor :omniauth
  attribute :email, :string
  attribute :password, :string

  validates :email, presence: true, unless: :omniauth
  validates :password, presence: true, unless: :omniauth
  validate :auth_user

  def save
    super
    user
  end

  private

  def auth_user
    if omniauth.present?
      self.user = User.authenticate omniauth
    else
      self.user = Author.authenticate email, password
    end

    if self.user.blank?
      errors.add :custom, I18n.t('activerecord.errors.models.session.not_matched')
    end
  end
end
