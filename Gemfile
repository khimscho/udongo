source 'https://rubygems.org'

# Declare your gem's dependencies in udongo.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# Active Record
gem 'mysql2'

# Javascript related
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'marked-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'compass-rails'

group :test do
  gem 'thor'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'database_cleaner'
end

group :test, :development do
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'rspec-rails'
  gem 'factory_girl_rails', require: false
  gem 'rb-fsevent'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end
