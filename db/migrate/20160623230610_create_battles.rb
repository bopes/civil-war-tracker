class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.references :event
      t.references :campaign
      t.references :victor
      t.string :conclusion

      t.timestamps null: false
    end
  end
end
