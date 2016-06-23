class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :army_id
      t.date :begin_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end
