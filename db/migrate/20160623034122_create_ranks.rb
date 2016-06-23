class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :player_id
      t.string :title
      t.date :begin_date
      t.date :end_end
      t.integer :army_id

      t.timestamps null: false
    end
  end
end
