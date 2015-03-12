class Scraping
#スクレイピング
  #urlと駅名の取得
  def self.get_stations
    #駅の名前、url情報の取得
    stations = [Setting.gakugeidai, Setting.toritu_daigaku, Setting.jiyugaoka, Setting.denentyohu, Setting.tamagawa, Setting.shinmaruko, Setting.musashikosugi]
    stations.each do |station|
      get_rsts(station)
    end
  end

  def self.get_rsts(station)
    agent = Mechanize.new
    main_page = agent.get(station.url)

    while main_page do
      links = []
      elements = main_page.search('.rstname a')
      elements.each do |ele|
        #各個人URLを保存
        links << ele.get_attribute('href')
      end

      links.each do |link|
        get_rst(link,station)
      end

     #次のページリンクを取得
      next_page = main_page.at('.page-num .next')
      if next_page.present? then
        next_url= next_page.get_attribute('href')
        main_page = agent.get(next_url)
      else
        break
      end
    end
  end

#各お店の個人ページにアクセス、かつ欲しい情報をもらう
  def self.get_rst(link, station)
    agent = Mechanize.new
    page = agent.get(link)
    rstname = page.at('.display-name').inner_text
    rst_url = page.at('#rdhead-name h2 a').get_attribute('href')
    #条件分岐が必要なもの
    #score
    if page.at('.score').present?
      score = page.at('.score').inner_text
    else
      score = nil
    end
     #image_url
    if page.at('.mainphoto-image').present? then
      image_url = page.at('.mainphoto-image').get_attribute('src')
    elsif page.at('.rstdtl-top-photo__photo a').present? then
      image_url = page.at('.rstdtl-top-photo__photo a').get_attribute('href')
    else
      image_url = nil
    end

    #値段の条件分岐
    #夜の値段がない場合
    if (page.at('.rdhead-budget__price-target') == nil ) then
       price_dinner = '-'
       if (page.at('.rdhead-budget__price-target') == nil ) then  #昼の値段がない場合
        price_lunch = '-'
       else #昼の値段がある場合
        price_lunch = page.at('.rdhead-budget__price-target').inner_text
       end
    #夜の値段がある場合
    else
      price_dinner = page.search('.rdhead-budget__price-target')[0].inner_text
      if (page.search('.rdhead-budget__price-target')[1] == nil) then  #昼の値段がない場合
        price_lunch = '-'
      else #昼の値段がある場合
        price_lunch = page.search('.rdhead-budget__price-target')[1].inner_text
      end
    end
    sleep 0.01
    #テーブルに保存する
    restaurant = Restaurant.where(:rstname => rstname).first_or_initialize
    restaurant.rst_url = rst_url
    restaurant.station = station.name
    restaurant.score = score
    restaurant.image_url = image_url
    restaurant.price_dinner = price_dinner
    restaurant.price_lunch = price_lunch

    restaurant.save
  end


end
