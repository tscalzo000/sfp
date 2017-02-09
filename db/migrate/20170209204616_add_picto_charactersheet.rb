class AddPictoCharactersheet < ActiveRecord::Migration[5.0]
  def up
    add_column :charactersheets, :url, :string
  end

  def down
    remove_column :charactersheets, :url, :string
  end
end
