class MusicImporter

    attr_accessor :path, :files

    def initialize(path)
        #accepts a file path to parse MP3 files from
        @path = path
    end

    def path
        #retrieves the path provided to the MusicImporter object
        @path
    end

    def files
        #loads all the MP3 files in the path directory
        #normalizes the filename to just the MP3 filename with no path

        self.files = Dir.glob("#{path}/*.mp3").collect { |file| file.gsub("#{@path}/", "") }
    end

    def import
        #imports the files into the library by invoking Song.create_from_filename

        files.each do |file|
            Song.create_from_filename(file)
        end
    end

end
