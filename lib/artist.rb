require 'pry'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
    @name = name
    @@all << self
    end

    def self.all
    @@all
    end

    def add_song(new_song)
        new_song.artist = self
    end

    def songs
        Song.all.select{|song|song.artist == self}
    end

    def self.find_me(name)
        self.all.find{|artist| artist.name == name}
    end

    def self.find_or_create_by_name(name_string)
        if self.find_me(name_string) 
            self.find_me(name_string)
        else
            self.new(name_string)
        end
    end

    def print_songs
        my_songs = self.songs.map{|song|song.name}
        puts my_songs
    end

end

artist1 = Artist.new('Michael Jackson')
artist2 = Artist.new('Adele')
artist3 = Artist.new('Selena Gomez')

#binding.pry
0
