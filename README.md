# YouTubeURL

YouTubeURL provides information about any valid YouTube URL.

- It can figure out the video ID of a YouTube URL.
- It can build a canonical YouTube URL based on any other YouTube URL or just the video ID.

## Installation

Add this line to your application's Gemfile:

    gem 'youtube_url'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install youtube_url

## Usage

    url = 'www.youtube.com/watch?v=7OLQnKr_sh8'
    YouTubeURL::Identifier.new(url).valid? # => true
    YouTubeURL::Identifier.new(url).id # => '7OLQnKr_sh8'
    YouTubeURL::Identifier.new(url).canonical_url # => 'http://www.youtube.com/watch?v=7OLQnKr_sh8'

    url = 'http://google.com'
    YouTubeURL::Identifier.new(url).valid? # => false
    YouTubeURL::Identifier.new(url).id # => YouTubeURL::InvalidURLError
    YouTubeURL::Identifier.new(url).canonical_url # => YouTubeURL::InvalidURLError

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
