class ArmiesBattles < ActiveRecord::Migration
  def change
    t.references :army
    t.references :battle
  end
end
