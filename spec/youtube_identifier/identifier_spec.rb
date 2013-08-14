require 'rspec'
require 'youtube_identifier'

describe YouTubeIdentifier::Identifier do
  describe '#valid?' do
    context 'with a valid YouTube URL' do
      specify do
        expect(YouTubeIdentifier::Identifier.new('http://youtube.com/watch?v=7OLQnKr_sh8')).to be_valid
      end
    end

    context 'with a YouTube URL without a video ID' do
      specify do
        expect(YouTubeIdentifier::Identifier.new('http://youtube.com/watch')).to_not be_valid
      end
    end

    context 'with a non-YouTube URL' do
      specify do
        expect(YouTubeIdentifier::Identifier.new('http://google.com')).to_not be_valid
      end
    end
  end

  describe '#id' do
    context 'for a given URL with a video ID' do
      it 'fetches the ID' do
        video_id = '7OLQnKr_sh8'

        urls = [
          'youtube.com/watch?v=7OLQnKr_sh8',
          'www.youtube.com/watch?v=7OLQnKr_sh8',
          'http://www.youtube.com/watch?v=7OLQnKr_sh8',
          'https://www.youtube.com/watch?v=7OLQnKr_sh8',
          'http://youtube.com/watch?v=7OLQnKr_sh8',
          'http://youtu.be/7OLQnKr_sh8',
          'http://www.youtube.com/embed/7OLQnKr_sh8?showinfo=0',
          'http://www.youtube.com/watch?v=7OLQnKr_sh8&feature=youtu.be',
          'http://www.youtube.com/watch?feature=player_embedded&v=7OLQnKr_sh8',
          'http://www.youtube.com/watch?v=7OLQnKr_sh8&feature=c4-overview&list=UUXHuWmYc0-eXz1dSXTLrO1Q',
          'http://www.youtube.com/watch?v=7OLQnKr_sh8&list=TLb6Fk7xTJEaw'
        ]

        urls.each do |url|
          expect(YouTubeIdentifier::Identifier.new(url).id).to eq(video_id)
        end
      end
    end

    context 'for a given invalid URL' do
      it 'raises an error' do
        expect {
          YouTubeIdentifier::Identifier.new('http://google.com').id
        }.to raise_error(YouTubeIdentifier::InvalidURLError, 'Please make sure the URL is a valid YouTube URL')
      end
    end
  end
end
