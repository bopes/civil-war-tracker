class CreateArmiesBattles < ActiveRecord::Migration
  def change
    create_table :armies_battles do |t|
      t.references :army
      t.references :battle

      t.timestamps null: false
    end
  end
end
