class CreateArmies < ActiveRecord::Migration
  def change
    create_table :armies do |t|
      t.references :side, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
