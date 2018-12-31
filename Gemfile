source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'faraday'
gem 'faker'
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false


group :development, :test do
  gem 'pry-rails'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0'
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
