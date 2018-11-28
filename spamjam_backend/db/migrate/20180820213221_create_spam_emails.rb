class CreateSpamEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :spam_emails do |t|
      t.string :contents
      t.belongs_to :user, foreign_key: true
      t.belongs_to :victim, foreign_key: true
      t.belongs_to :spam_type, foreign_key: true

      t.timestamps
    end
  end
end
