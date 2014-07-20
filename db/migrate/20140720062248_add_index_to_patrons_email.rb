class AddIndexToPatronsEmail < ActiveRecord::Migration
  def change
  	add_index :patrons, :email, unique: true
  end
end
