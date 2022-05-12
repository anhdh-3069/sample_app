class User < ApplicationRecord
  VALID_EMAIL_REGEX = Settings.user.email_regex

  before_save :email_downcase

  validates :email, presence: true,
            length: {maximum: Settings.user.email.max_length},
            format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  validates :name, presence: true,
            length: {maximum: Settings.user.name.max_length}
  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length}

  has_secure_password

  def email_downcase
    email.downcase!
  end
end
