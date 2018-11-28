class User < ApplicationRecord
  has_many :spam_emails
  has_many :fake_emails
  has_many :victims, through: :spam_emails

  validates :real_email, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :real_email, uniqueness: true
end
