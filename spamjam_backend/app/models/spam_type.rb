class SpamType < ApplicationRecord
  has_many :spam_emails
  has_many :victims, through: :spam_emails
  has_many :users, through: :spam_emails
end
