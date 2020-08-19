class Anime

    @@all = [] 

    attr_accessor :name, :release, :description

    def initialize(number, name, release, description)
        @number = number
        @name = name
        @release = release
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_number(number)
        self.all.find{|anime| anime.number == number}
    end

end
