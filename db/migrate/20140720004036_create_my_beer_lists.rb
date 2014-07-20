class CreateMyBeerLists < ActiveRecord::Migration
  def change
    create_table :my_beer_lists do |t|
      t.integer :patron_id
      t.integer :beer_id

      t.timestamps
    end
  end
end
