class AddLocationNameToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :location_name, :string
  end
end
