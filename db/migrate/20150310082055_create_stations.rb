class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :station

      t.timestamps
    end
  end
end
