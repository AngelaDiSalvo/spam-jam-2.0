class SpamEmail < ApplicationRecord
  belongs_to :user
  belongs_to :victim
  belongs_to :spam_type

  def self.favorite_type
    new_hash = Hash.new(0)
    SpamEmail.all.each do |email|
      new_hash[email.spam_type] += 1
    end
    new_hash.max_by{|k,v| v}
  end

  def self.total
    SpamEmail.all.length
  end

  def self.saddest
    new_hash = Hash.new(0)
    SpamEmail.all.each do |email|
      new_hash[email.victim] += 1
    end
    new_hash.max_by{|k,v| v}
  end

end
