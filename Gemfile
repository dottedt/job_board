source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg', '0.17.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Beautiful, DRY, well-indented, clear markup
gem "haml", "~> 4.0.3"

# Flexible authentication solution for Rails based on Warden
gem 'devise', '3.2.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  # Code testing
  gem 'rspec-rails', '2.14.0'
  # Automatically run tests when files are changed
  gem 'guard-rspec', '4.0.1'

  # To over come a known issue in guard-spork we're pointing to the github branch.
  gem 'guard-spork', github: 'guard/guard-spork'
  gem 'spork', '1.0.0rc4'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  gem "bullet"
  gem "rack-mini-profiler", "0.9.1"
end


group :test do
  gem 'faker', '~> 1.2.0'
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'shoulda', '3.5.0'
  gem 'simplecov', require: false
end


# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem "unicorn-rails"

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
