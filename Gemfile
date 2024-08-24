source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.6"

gem "rails", "~> 7.0.8", ">= 7.0.8.4"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
end
