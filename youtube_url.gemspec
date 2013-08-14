# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtube_url/version'

Gem::Specification.new do |spec|
  spec.name          = 'youtube_url'
  spec.version       = YouTubeURL::VERSION
  spec.authors       = ['Danny Olson']
  spec.email         = ['danny@sharethrough.com']
  spec.description   = %q{YouTubeURL provides information about any valid YouTube URL.}
  spec.summary       = %q{YouTubeURL provides information about any valid YouTube URL.}

  spec.homepage      = 'https://github.com/sharethrough/youtube_url'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
