class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.references :side, foreign_key: true
      t.text :bio
      t.date :birthdate

      t.timestamps null: false
    end
  end
end
