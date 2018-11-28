class Victim < ApplicationRecord
  has_many :spam_emails
  has_many :users, through: :spam_emails

  validates :real_email, format: { with: URI::MailTo::EMAIL_REGEXP }



end
