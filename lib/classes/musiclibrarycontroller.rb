require 'pry'

class MusicLibraryController

    def initialize(path="./db/mp3s")
        #accepts one argument, the path to the MP3 files to be imported
        #creates a new MusicImporter object, passing in the 'path' value
        #the 'path' argument defaults to './db/mp3s'
        #invokes the #import method on the created MusicImporter object
        @path = path
        music_importer = MusicImporter.new(path)
        music_importer.import
    end

    def call
        #welcomes the user
        #asks the user for input
        #loops and asks for user input until they type in exit

        input = ""

        while input != "exit"
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        
        input = gets.strip
        
        list_songs if input == 'list songs'
        list_artists if input == 'list artists'
        list_genres if input == 'list genres'
        list_songs_by_artist if input == 'list artist'
        list_songs_by_genre if input == 'list genre'
        play_song if input == 'play song'
        end
    end

    def list_songs
        Song.all.sort_by { |song| song.name }.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        binding.pry
    end 

    # def list_songs
    #     alphabetized_songs = Song.all.sort { |a, b| a.name <=> b.name }
    #     song_list = alphabetized_songs.each_with_index do |song, index|
    #         puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    #     end
    #     song_list
    # end

    def list_artists
        alphabetized_artists = Artist.all.sort_by { |artist| artist.name }
        artist_list = alphabetized_artists.each_with_index(1) do |artist, index|
            puts "#{index}. #{artist.name}"
        end
        artist_list
        binding.pry
    end

    def list_genres
        Genre.all.sort_by {|genre| genre.name }.each_with_index do |genre, index|
            puts "#{index + 1}. #{genre.name}"
        end
    end
end