class Anime

    @@all = [] 

    attr_accessor :name, :release, :description

    def initialize()
       
        @@all << self
    end

    def self.all
        @@all
    end

end
