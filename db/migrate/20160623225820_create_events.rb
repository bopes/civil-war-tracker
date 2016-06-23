class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.date :date
      t.integer :type
      t.integer :battle_id

      t.timestamps null: false
    end
  end
end
