class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :last_name
      t.string :first_name
      t.boolean :text_updates
      t.string :phone
      t.boolean :email_updates
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
