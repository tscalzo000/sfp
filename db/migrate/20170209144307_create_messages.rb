class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.references :conversation, index: true, null: false
      t.references :user, index: true, null: false
      t.boolean :read, default: false

      t.timestamps null: false
    end
  end
end
