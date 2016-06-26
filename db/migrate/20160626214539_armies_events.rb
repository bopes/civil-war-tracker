class ArmiesEvents < ActiveRecord::Migration
  def change
    t.references :army
    t.references :event
  end
end
