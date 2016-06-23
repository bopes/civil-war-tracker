class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.integer :event_id
      t.date :begin_date
      t.date :end_date
      t.integer :campaign_id
      t.integer :victor_id
      t.string :conclusion

      t.timestamps null: false
    end
  end
end
