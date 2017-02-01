class AddOtherToGames < ActiveRecord::Migration[5.0]
  def up
    add_column :games, :other, :string
  end

  def down
    remove_column :games, :other
  end
end
