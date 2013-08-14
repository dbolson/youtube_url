require 'rspec'
require 'youtube_identifier'

describe YouTubeIdentifier do
  describe '.id' do
    context 'for a given URL' do
      it 'fetches the video ID' do
        urls = [
          { '7OLQnKr_sh8' => 'http://www.youtube.com/watch?v=7OLQnKr_sh8' }
        ]

        urls.each do |url|
          video_id = url.flatten[0]
          full_url = url.flatten[1]

          expect(YouTubeIdentifier.id(full_url)).to eq(video_id)
        end
      end
    end
  end
end
