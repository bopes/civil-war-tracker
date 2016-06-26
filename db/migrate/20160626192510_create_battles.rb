class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.date :begin_date
      t.date :end_date
      t.string :name
      t.references :location, index: true, foreign_key: true
      t.references :victor, index: true, foreign_key: true
      t.references :campaign, index: true, foreign_key: true
      t.string :conclusion
      t.string :description

      t.timestamps null: false
    end
  end
end
