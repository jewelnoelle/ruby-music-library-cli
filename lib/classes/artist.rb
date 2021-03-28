class Artist
#extends the Concerns::Findable module
extend Concerns::Findable

    attr_accessor :name
    
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(name)
        artist = Artist.new(name)
        artist.save
        artist
    end

    def songs
        #returns the artist's 'songs' collection (artist has many songs)
        @songs = Song.all.select do |song_choice| 
            song_choice.artist == self
        end
        @songs.uniq
    end

    def add_song(song)
        #assigns the current artist to the song's 'artist' property (song belongs to artist) self.songs << song
        #does not assign the artist if the song already has an artist
        #adds the song to the current artist's 'songs' collection
        #does not add the song to the current artist's collection of songs if it already exists therein
        song.artist = self unless song.artist || song.artist == self
        self.songs << song if self.songs.include?(song) == false
    end

    def genres #this is probs wrong lol
        #returns a collection of genres for all of the artist's songs (artist has many genres through songs)
        #does not return duplicate genres if the artist has more than one song of a particular genre (artist has many genres through songs)
        self.songs.collect { |song| song.genre }.uniq
    end

end