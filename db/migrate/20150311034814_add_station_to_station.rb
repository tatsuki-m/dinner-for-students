class AddStationToStation < ActiveRecord::Migration
  def change
    add_column :stations, :station_url, :text
    add_column :stations, :station_image1, :text
    add_column :stations, :station_image2, :text
  end
end
