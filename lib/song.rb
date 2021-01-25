class Song
    attr_accessor :name, :artist, :genre
    @@all = []
    def initialize(name)
        self.name = name
        self.class.all << self
    end

    def self.all
        @@all
    end
    
    def self.new_by_filename(filename)
        song_infos = filename.split(".mp3")[0].split(" - ")
        song = self.new(song_infos[1])
        song.artist = Artist.new(song_infos[0])
        song.genre = song_infos[2]
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
        



end