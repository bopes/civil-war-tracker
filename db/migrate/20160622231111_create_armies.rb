class CreateArmies < ActiveRecord::Migration
  def change
    create_table :armies do |t|
      t.integer :side_id
      t.string :name

      t.timestamps null: false
    end
  end
end
