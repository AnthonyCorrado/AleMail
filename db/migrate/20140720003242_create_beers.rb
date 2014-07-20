class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :style
      t.string :comments
      t.string :brewery_location
      t.integer :user_id

      t.timestamps
    end
  end
end
