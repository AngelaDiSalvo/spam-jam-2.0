class CreateFakeEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :fake_emails do |t|
      t.string :email
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
