# require 'pry'

# class Song
# #     attr_accessor :name, :artist, :genre

# # #  #artist=
# # #    invokes Artist #add_song to add itself to the artist's collection of songs (artist has many songs)
# # #  #initialize
# # #    invokes #artist= instead of simply assigning to an @artist instance variable to ensure that associations are created upon initialization

# #     @@all = []

# #     def initialize(name)
# #         @name = name
# #         @artist = artist
# #         @genre = genre
# #     end

# #     def artist=(artist)
# #         @artist = artist 
# #     end

# #     def self.all
# #         @@all
# #     end

# #     def self.destroy_all
# #         @@all.clear
# #     end

# #     def save
# #         @@all << self
# #     end

# #     def self.create(name)
# #         song = Song.new(name)
# #         song.save
# #         song
# #     end

#     def self.find_by_name(song_name)
#         self.all.find do |song|
#             song.name == song_name
#         end
#     end

#     def self.find_or_create_by_name(song_name)
#         self.all.find do |song|
#             if song.name == song_name
#                 song
#             else
#                 self.create(song_name)
#             end
#         end
#     end

# end

# class Artist
#     # attr_accessor :name

#     # @@all = []

#     # def initialize(name)
#     #     @name = name
#     #     @songs = []
#     # end

#     # def self.all
#     #     @@all
#     # end

#     # def self.destroy_all
#     #     @@all.clear
#     # end

#     # def save
#     #     @@all << self
#     # end

#     # def self.create(name)
#     #     artist = Artist.new(name)
#     #     artist.save
#     #     artist
#     # end

#     def songs
#         #returns the artist's 'songs' collection (artist has many songs)
#         Song.all.select { |song| song.artist == self }
#     end

#     def add_song(song_name)
#         Song.all.find do |song|
#             if song.name != song_name
#                 song = Song.new(song_name)
#                 song.artist = self
#                 Song.all << song
#             end
#         end
#     end
#     # assigns the current artist to the song's 'artist' property (song belongs to artist)
#     # does not assign the artist if the song already has an artist
#     # adds the song to the current artist's 'songs' collection
#     # does not add the song to the current artist's collection of songs if it already exists therein

#     def genres
#         artist_genres = songs.select do |song|
#             song.genre
#         end
#         artist_genres.uniq
#         binding.pry
#     end
# end

# class Genre
#     # attr_accessor :name

#     # @@all = []

#     # def initialize(name)
#     #     @name = name
#     # end

#     # def self.all
#     #     @@all
#     # end

#     # def self.destroy_all
#     #     @@all.clear
#     # end

#     # def save
#     #     @@all << self
#     # end

#     # def self.create(name)
#     #     genre = Genre.new(name)
#     #     genre.save
#     #     genre
#     # end

#     def songs
#         Song.all.select { |song| song.genre == self }
#     end
#     end

#     def artists
#         # returns a collection of artists for all of the genre's songs (genre has many artists through songs) (FAILED - 24)
#         # does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs) (FAILED - 25)
#     end
# end