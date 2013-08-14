module YouTubeIdentifier
  class Identifier
    def initialize(url)
      @url = url
    end

    def valid?
      url_regexp.match(url)
    end

    def id
      raise InvalidURLError unless self.valid?

      url_regexp.match(url) do |match|
        match[1]
      end
    end

    private

    attr_reader :url

    def url_regexp
      /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/
    end
  end
end