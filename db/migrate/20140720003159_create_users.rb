class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :bar_name
      t.string :username
      t.string :password_digest
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
