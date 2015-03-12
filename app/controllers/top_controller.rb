class TopController < ReviewController
  def index
    @stations = Station.order('updated_at DESC')
    @restaurants = Restaurant.group(:score).order('score DESC').limit(5)
  end

  def search
    @stations = Station.all.map{|station| [station.station, station.station]}

    if params[:restaurant].present?
        if params[:restaurant][:station].present? && params[:restaurant][:price_dinner].present?
          @restaurants = Restaurant.where(station: params[:restaurant][:station], price_dinner: params[:restaurant][:price_dinner]).page(params[:page]).per(10).order("created_at DESC")

        elsif params[:restaurant][:station].present?
          @restaurants = Restaurant.where(station: params[:restaurant][:station]).page(params[:page]).per(10).order("created_at DESC")
        else
          @restaurants = Restaurant.where(price_dinner: params[:restaurant][:price_dinner]).page(params[:page]).per(10).order("created_at DESC")
        end
    else
      @restaurants = Restaurant.where(:station => "日吉駅").page(params[:page]).per(10).order("created_at DESC")
    end
  end



  # def index
  #   prices = %W( ～￥999 ￥1,000～￥1,999 ￥2,000～￥2,999 ￥3,000～￥3,999)
  #   restaurants =[]
  #   prices.each do |price|
  #     restaurants << Restaurant.where(:price_dinner => price).group(:score).order('score DESC').limit(10)
  #   end
  # end

end