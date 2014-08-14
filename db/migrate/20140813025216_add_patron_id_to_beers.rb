class AddPatronIdToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :patron_id, :integer
  end
end
