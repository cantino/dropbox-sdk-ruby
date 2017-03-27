module Dropbox
  class MediaInfo
    attr_reader :dimensions, :time_taken, :location

    def initialize(attrs={})
      if dimensions = attrs.delete('dimensions')
        @dimensions = Dimensions.new(dimensions)
      end

      if location = attrs.delete('location')
        @location = Location.new(location)
      end

      if time_taken = attrs.delete('time_taken')
        @time_taken = Time.parse(time_taken)
      end
    end
  end

  class PhotoMetadata < MediaInfo
    def initialize(attrs={})

      super(attrs)
    end
  end

  class VideoMetadata < MediaInfo
    attr_reader :duration

    def initialize(attrs={})
      @duration = attrs.delete('duration')

      super(attrs)
    end
  end

  class Location
    attr_reader :latitude, :longitude

    def initialize(attrs={})
      @latitude = attrs.delete('latitude')
      @longitude = attrs.delete('longitude')
    end
  end

  class Dimensions
    attr_reader :width, :height

    def initialize(attrs={})
      @width = attrs.delete('width')
      @height = attrs.delete('height')
    end
  end
end
