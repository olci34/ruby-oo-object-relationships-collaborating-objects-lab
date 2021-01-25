class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        self.name = name
        self.class.all << self
        @songs = []
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end
        
    def add_song(song)
        song.artist = self
        self.songs << song
    end

    def self.find_or_create_by_name(artist_name)
        the_artist = @@all.find {|artist| artist.name == artist_name}
        the_artist ? the_artist : self.new(artist_name)
    end

    def print_songs
        Song.all.each do |song|
            if song.artist == self
                puts song.name
            end
        end
    end

end