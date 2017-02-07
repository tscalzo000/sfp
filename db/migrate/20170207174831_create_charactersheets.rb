class CreateCharactersheets < ActiveRecord::Migration[5.0]
  def change
    create_table :charactersheets do |t|
      t.belongs_to :user, null: false
      t.string :name
      t.string :race
      t.string :age
      t.string :alignment
      t.string :classtype
      t.integer :level
      t.string :abilities
      t.string :description
      t.string :backstory
      t.string :appearance
      t.string :languages
      t.string :equipment
      t.string :weapons
      t.string :spells
      t.string :gold
      t.string :other
    end
  end
end
