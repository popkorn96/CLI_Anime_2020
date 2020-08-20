require 'pry'

class CLI
    #this method calls get anime, the scraper, and list_anime, the welcome message and list of anime
    def call
        self.get_anime
        self.list_anime
    end
    #this method gets initiates an instance of the Scraper class 
    def get_anime
        Scraper.new.scrape_anime
    end

    #this method includes the welcome message and directs to the list_all method 
    def list_anime
        puts ""
        puts "Welcome to Anime 2020!"
        puts ""
        puts "This is a list of anime that has come out, or will come out in 2020!"
        puts ""
        sleep(5.5)
        self.list_all
    end
    #this method shows a numbered list of the anime and directs to the more_info method
    def list_all
        Anime.all.sort{|a,b| a.name <=> b.name}.each_with_index do |anime,i|
            puts "#{i+1}. #{anime.name}"
        end
        self.more_info
    end
    #this method asks the user for a number to show more information about a specific anime listed in list_all, 
    #it redirects to list_all if the input is invalid
    def more_info
        puts ""
        puts ""
        puts "  Please enter a number for more information about an anime!"
        input = gets.strip.to_i
        
        if input > 0 && input <= Anime.all.length 
            array = Anime.all.uniq.sort{|a,b| a.name <=> b.name}
            anime = array[input-1]
            puts ""
            puts "Anime: #{anime.name}"
            puts ""
            puts "Description: #{anime.description}"
            puts ""
            puts "Release date: #{anime.release}"
            puts ""
        else input < 0 && input > Anime.all.length
            puts ""
            puts "Invalid number, please try again :) "
            puts ""
            sleep(2.5)
            self.list_all
          end
        end



    end
#binding.pry

