class AddBeerIdToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :beer_id, :integer
  end
end
