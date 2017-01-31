class CreateSignups < ActiveRecord::Migration[5.0]
  def change
    create_table :signups do |t|
      t.belongs_to :user, null: false
      t.belongs_to :game, null: false
      t.timestamps null: false
    end
  end
end
