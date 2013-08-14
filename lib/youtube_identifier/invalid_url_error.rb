module YouTubeIdentifier
  class InvalidURLError < StandardError
    def initialize(message='Please make sure the URL is a valid YouTube URL')
      super(message)
    end
  end
end
