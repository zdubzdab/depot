source 'https://rubygems.org'
ruby '2.1.4'

gem 'rails', '4.0.2'

gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'devise'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem "twitter-bootstrap-rails"
gem "cancan"
gem 'faker'

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'web-console', '~> 2.0'
end

#heroku
group :development, :production do
  gem 'pg'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'spork', github: 'sporkrb/spork'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'childprocess'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'libnotify'
  gem 'factory_girl_rails'
end






