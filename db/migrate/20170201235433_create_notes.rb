class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.belongs_to :game, null: false
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.string :body, null: false
      t.timestamps null: false
    end
  end
end
