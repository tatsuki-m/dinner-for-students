class Restaurant < ActiveRecord::Base
  belongs_to :station

#データベースになにか直接働きかけるものに対しては、modelに書いてしまった方がいい
#アソシエーションのために、station_idをrestaurantsのテーブルに書き込む
#渋谷と横浜はスクレイピングしていないので、iは2~20で回す
  def self.update
    i = 1
    while (i < 20) do
       i += 1
      station = Station.find(i)
      Restaurant.where(:station => station.station).update_all(station_id:  "#{i}")
    end
  end


end
