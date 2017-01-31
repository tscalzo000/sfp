class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name, null: false, default: '', unique: true
      t.string :description, null: false, default: ''
      t.integer :playernum, null: false
      t.integer :dm_id, null: false
      t.string :type, null: false, default: ''
      t.string :location, null: false, default: ''
      t.string :time, null: false
      t.string :day, null: false
      t.string :frequency, null: false
      t.string :cover
      t.timestamps null: false
    end
  end
end
