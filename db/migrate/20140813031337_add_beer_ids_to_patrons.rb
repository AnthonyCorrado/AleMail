class AddBeerIdsToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :beer_id_two, :integer
    add_column :patrons, :beer_id_three, :integer
  end
end
