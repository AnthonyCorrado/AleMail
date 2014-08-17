class RemoveAddIndexFromPatrons < ActiveRecord::Migration
  def change
  	remove_index(:patrons, :name => "index_patrons_on_email")
  end
end
