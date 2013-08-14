shared_examples_for 'it raises an error with an invalid URL' do |method|
  it 'raises an error' do
    expect {
      YouTubeIdentifier::Identifier.new('http://google.com').public_send(method)
    }.to raise_error(YouTubeIdentifier::InvalidURLError, 'Please make sure the URL is a valid YouTube URL')
  end
end
