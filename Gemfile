source 'https://rubygems.org'

# Web framework
gem 'rails', '~> 3.2.13'

# Assets
gem 'therubyracer', :platforms => :ruby, :require => 'v8'
gem 'libv8'
gem 'uglifier', '>= 1.0.3', group: :assets

# PostgreSQL database driver
gem 'pg'

# Alternate HTML template language
gem 'haml', '~> 4.0.5'

# Alternate stylesheet template language
gem 'sass-rails', '~> 3.2.3'

# Bootstrap, compatible with sass templates
gem 'bootstrap-sass', '2.1'

# Ruby templating for JSON
gem 'rabl'

# Send Ruby variables to your Javascript
gem 'gon'

# jQuery Javascript library
gem 'jquery-rails'

# jQuery user interface widgets
gem 'jquery-ui-rails'

# The jQuery autocomplete widget
gem 'rails3-jquery-autocomplete'

# Javascript graphing library
gem 'd3-rails'

# Javascript maps
gem 'leaflet-rails'

# Turn addresses into lat/lon coordinates, calculate geographic distances
gem 'geocoder'

# Generate HTML forms more succinctly
gem 'simple_form'

# Send email straight from forms
gem 'mail_form'

# Deployment
gem 'unicorn-rails'
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rvm', github: "capistrano/rvm"

group :development, :test do

  # Test object factory
  gem 'factory_girl_rails'

end

group :test do

  # Default test framework
  gem 'rspec'
  gem 'rspec-rails'

  # Acceptance testing
  gem 'cucumber-rails', require: false

  # Clean out database between test runs
  gem 'database_cleaner'

  # DSL for browser based testing
  gem 'capybara'

  # PhantomJS driver for capybara
  gem 'poltergeist'

  # See what your headless browser is seeing with save_and_open_page
  gem 'launchy'

  # Helpful RSpec matchers for rails
  gem 'shoulda-matchers', require: false

  # Rspec matchers for foreign keys
  gem 'foreigner-matcher'

  # Validate HTML and CSS
  gem 'be_valid_asset'

end
