class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :rstname
      t.integer :score
      t.string :price_lunch
      t.string :price_dinner
      t.string :station
      t.text :rst_url
      t.text :image_url

      t.timestamps
    end
  end
end
