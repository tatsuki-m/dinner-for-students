# class Scraping2
#   def self.get_stations_info
#     agent = Mechanize.new
#     main_page = agent.get("http://www.tokyu.co.jp/ekitown/ty/")

#     while main_page do
#       links = []
#       elements = main_page.search('.row row01 left-start li')
#       names= main_page.at('.row row01 left-start li').inner_text
#       elements.each do |ele|
#         links << ele.get_attribute('href')
#       end

#       links.each do |link|
#         get_station_info(link)
#       end
#     end
#   end

#   def self.get_station_info(link)
#     agent = Mechanize.new
#     page = page.get(link)
#     image1 = page.at('.page-title').get_attribute('src')
#     image2 = page.at('.visual').get_attribute('src')
#     station.station_image1 = image1
#     station.station_image2 = image2
#     restaurant.save
#      Restaurant.where(:station => station.station).update_all(station_id:  "#{i}")
#   end

# end

