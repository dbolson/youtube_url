require 'spec_helper'
require 'youtube_url'

describe YouTubeURL::Identifier do
  def urls
    [
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
  end

  describe '#valid?' do
    context 'with a valid YouTube URL' do
      specify do
        expect(YouTubeURL::Identifier.new('http://youtube.com/watch?v=7OLQnKr_sh8')).to be_valid
      end
    end

    context 'with a YouTube URL without a video ID' do
      specify do
        expect(YouTubeURL::Identifier.new('http://youtube.com/watch')).to_not be_valid
      end
    end

    context 'with a non-YouTube URL' do
      specify do
        expect(YouTubeURL::Identifier.new('http://google.com')).to_not be_valid
      end
    end
  end

  describe '#id' do
    context 'for a valid URL' do
      it 'fetches the ID' do
        video_id = '7OLQnKr_sh8'

        urls.each do |url|
          expect(YouTubeURL::Identifier.new(url).id).to eq(video_id)
        end
      end
    end

    context 'for an invalid URL' do
      it_behaves_like 'it raises an error with an invalid URL', :id
    end
  end

  describe '#canonical_url' do
    context 'for a valid URL' do
      it 'builds the full YouTube URL without extra parameters' do
        canonical_url = 'http://www.youtube.com/watch?v=7OLQnKr_sh8'

        urls.each do |url|
          expect(YouTubeURL::Identifier.new(url).canonical_url).to eq(canonical_url)
        end
      end
    end

    context 'for an invalid URL' do
      it_behaves_like 'it raises an error with an invalid URL', :canonical_url
    end
  end
end
