class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.user.email_regex

  attr_accessor :remember_token, :activation_token

  before_save :email_downcase
  before_create :create_activation_digest

  validates :email, presence: true,
            length: {maximum: Settings.user.email.max_length},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :name, presence: true,
            length: {maximum: Settings.user.name.max_length}
  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length},
            allow_nil: true

  has_secure_password

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?

    BCrypt::Password.new(digest).is_password? token
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def activate
    update_attribute :activated, true
    update_attribute :activated_at, Time.zone.now
  end

  def mail_send_active
    UserMailer.account_activation(self).deliver_now
  end

  private

  def email_downcase
    email.downcase!
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest activation_token
  end
end
