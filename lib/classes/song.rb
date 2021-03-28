require 'pry'

class Song

    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name=nil, artist=nil, genre=nil)
        #can be invoked with an optional second argument, an Artist object to be assigned to the song's 'artist' property (song belongs to artist)
        #invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization
        
        #can be invoked with an optional third argument, a Genre object to be assigned to the song's 'genre' property (song belongs to genre)
        #invokes #genre= instead of simply assigning to a @genre instance variable to ensure that associations are created upon initialization
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre
        save
    end

    def name=(name)
        @name = name
    end

    def name
        @name
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
        song = Song.new(name)
        song
    end

    def artist
        #returns the artist of the song (song belongs to artist)
        @artist
    end

    def artist=(artist) #come back to
        #assigns an artist to the song (song belongs to artist)
        #***invokes Artist#add_song to add itself to the artist's collection of songs (artist has many songs)
        @artist = artist
        artist.add_song(self)
        # artist.add_song(self)
    end

    def genre
        #returns the genre of the song (song belongs to genre)
        @genre
    end

    def genre=(genre)
        #assigns a genre to the song (song belongs to genre)
        #adds the song to the genre's collection of songs (genre has many songs)
        #does not add the song to the genre's collection of songs if it already exists therein
        @genre = genre #assigns genre property
        genre.songs << self unless genre.songs.include?(self)
    end

    def self.find_by_name(song_name)
        #finds a song instance in @@all by the name property of the song
        @@all.find { |song| song.name == song_name }
    end

    def self.find_or_create_by_name(song_name)
        #*#*#returns (does not recreate) an existing song with the provided name if one exists in @@all
        #invokes .find_by_name instead of re-coding the same functionality
        #creates a song if an existing match is not found
        #invokes .create instead of re-coding the same functionality

        if self.find_by_name(song_name) == nil
            self.create(song_name)
        elsif self.find_by_name(song_name)
            self.find_by_name(song_name)
        end
    end

    def self.new_from_filename(filename)
        #initializes a song based on the passed-in filename
        #invokes the appropriate Findable methods so as to avoid duplicating objects
        #demo filename: "thundercat - for love i come - dance.mp3"
        song_parts = filename.split(" - ")
            # => thundercat, for love i come, dance

        artist_name = song_parts[0]
        song_name = song_parts[1]
        genre_name = song_parts[2].gsub(".mp3", "")

        new_artist = Artist.find_or_create_by_name(artist_name)
        new_genre = Genre.find_or_create_by_name(genre_name)
        new_song = Song.new(song_name, new_artist, new_genre)
    end

    def self.create_from_filename(filename)
        #initializes and saves a song based on the passed-in filename
        #invokes .new_from_filename instead of re-coding the same functionality

        song = self.new_from_filename(filename)
        song.save
        song
    end
end       


