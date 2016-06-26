class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :campaign, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.date :begin_date
      t.date :end_date
      t.text :description

      t.timestamps null: false
    end
  end
end
