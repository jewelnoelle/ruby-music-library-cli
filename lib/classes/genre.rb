class Genre
#extends the Concerns::Findable module
extend Concerns::Findable

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
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
        genre = Genre.new(name)
        genre.save
        genre
    end

    def songs
        #returns the genre's 'songs' collection (genre has many songs)
        @songs = Song.all.select { |song| song.genre == self }
        @songs.uniq
    end

    def artists #this is probs wrong lol
        #returns a collection of artists for all of the genre's songs (genre has many artists through songs)
        #does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)

        self.songs.collect { |song| song.artist }.uniq

        # genres_songs = Song.all.select do |song|
        #     song.genre == self #select all songs that match this genre
        #     genres_artists = genres_artists.collect do |genre_song|
        #         genre_song.artist
        #     end
        # end
        # genres_artists.uniq
    end
end

