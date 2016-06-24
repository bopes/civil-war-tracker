class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :desc, null: false
      t.date :begin_date, null: false
      t.date :end_date
      t.references :link, polymorphic: true, index: true
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
