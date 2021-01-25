class MP3Importer
    attr_accessor :path
    def initialize(path)
        self.path = path
    end

    def files
        Dir.chdir(self.path) do
        Dir["*.mp3"]
        end
    end

    def import
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end
end

