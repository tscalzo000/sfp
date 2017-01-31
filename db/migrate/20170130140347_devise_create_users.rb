class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      ## Extra
      t.string :username,           null: false, default: '', unique: true
      ## Database authenticatable
      t.string :email,              null: false, default: '', unique: true
      t.string :encrypted_password, null: false, default: ''

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
