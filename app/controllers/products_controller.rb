class ProductsController < ReviewController
  def show
    #それぞれの駅のお店を選ぶ
    @station = Station.find(params[:id])
    station_restaurant = Restaurant.where(:station_id => params[:id])
    prices = %W( ～￥999 ￥1,000～￥1,999 ￥2,000～￥2,999 ￥3,000～￥3,999)
    restaurants =[]
    #適切な値段のお店を選ぶ
    prices.each do |price|
      restaurants << station_restaurant.where(:price_dinner => price)
    end
    #現在、=999,1000~1999...の値段が配列をつくり、それをまとめる配列がある状態（つまり配列の配列）なので、まずその配列の配列をflatにするために、flattenメソッドをして、scoreでソートする
    #ランキングの中には、値段が3999以下の評判が高い順にソートされたレストランが10こある
    @ranking = restaurants.flatten.sort{|a,b| b[:score] <=> a[:score]}[0..9]
  end

end