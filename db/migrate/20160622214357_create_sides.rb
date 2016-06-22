class CreateSides < ActiveRecord::Migration
  def change
    create_table :sides do |t|
      t.string :name, presence: true

      t.timestamps null: false
    end
  end
end
