require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'
#require_relative './anime'

class Scraper
    def scrape_anime
        doc = Nokogiri::HTML(open("https://myanimelist.net/anime/season/2020/fall"))
        anime_list = doc.css("div.seasonal-anime.js-seasonal-anime")
        anime_list.each do |anime|
          new_anime = Anime.new
          #new_anime.number = i
          new_anime.name = anime.css("div.title p a").text.strip
          new_anime.release = anime.css("div.information div.info span.remain-time").text.strip
          new_anime.description = anime.css("div.synopsis.js-synopsis span.preline").text.strip
        end
    end

end

#binding.pry
