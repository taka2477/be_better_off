source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby                '2.5.1'

gem 'rails',        '~> 5.2.1'
gem 'puma',         '~> 3.11'
gem 'sass-rails',   '~> 5.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks',   '~> 5'
gem 'jbuilder',     '~> 2.5'
gem 'bootsnap',     '>= 1.1.0', require: false
gem 'devise'
gem 'kaminari'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'bootstrap',     '~> 4.1.0'
gem 'devise-bootstrap-views'
gem 'rails_admin'
gem 'cancancan'
gem 'acts-as-taggable-on'
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'
gem 'dotenv-rails'
gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'rails-erd'
  gem 'annotate'
  gem 'capybara'
  gem 'bullet'
  gem 'launchy'
end

group :production do
  gem 'pg',                    '~> 0.19.0'
  gem 'rails_12factor'
end

group :development do
  gem 'web-console',           '>= 3.3.0'
  gem 'listen',                '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop-airbnb'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
