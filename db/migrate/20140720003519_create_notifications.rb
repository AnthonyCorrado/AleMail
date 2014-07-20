class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :beer_id
      t.integer :patron_id
      t.string :message_content

      t.timestamps
    end
  end
end
