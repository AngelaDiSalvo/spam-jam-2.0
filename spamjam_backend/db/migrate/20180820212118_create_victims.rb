class CreateVictims < ActiveRecord::Migration[5.2]
  def change
    create_table :victims do |t|
      t.string :name
      t.string :real_email

      t.timestamps
    end
  end
end
