class User < ApplicationRecord
  VALID_EMAIL_REGEX = Setting.user.email_regex

  before_save :email_downcase

  validates :email, presence: true,
            length: {maximum: Setting.email.max_length},
            format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true,
            length: {maximum: Setting.name.max_length}
  validates :password, presence: true,
            length: {minimum: Setting.password.min_lenght}

  has_secure_password

  def email_downcase email
    email.downcase!
  end
end
