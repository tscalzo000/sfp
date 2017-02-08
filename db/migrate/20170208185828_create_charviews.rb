class CreateCharviews < ActiveRecord::Migration[5.0]
  def change
    create_table :charviews do |t|
      t.belongs_to :charactersheet
      t.belongs_to :user
    end
  end
end
