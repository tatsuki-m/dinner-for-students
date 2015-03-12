class AddColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :station_id, :integer
  end
end
