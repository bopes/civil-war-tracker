class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :city
      t.string :state
      t.string :county
      t.decimal :lat
      t.decimal :long

      t.timestamps null: false
    end
  end
end
