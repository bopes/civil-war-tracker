class CreateArmiesEvents < ActiveRecord::Migration
  def change
    create_table :armies_events do |t|
      t.references :army
      t.references :event

      t.timestamps null: false
    end
  end
end
