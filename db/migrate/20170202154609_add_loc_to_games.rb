class AddLocToGames < ActiveRecord::Migration[5.0]
  def up
    add_column :games, :lat, :float
    add_column :games, :lng, :float
  end
  def down
    remove_column :games, :lat, :float
    remove_column :games, :lng, :float
  end
end
