class ChangeDatatypeScoreOfRestaurantss < ActiveRecord::Migration
  def change
    change_column :restaurants, :score, :float
  end
end
