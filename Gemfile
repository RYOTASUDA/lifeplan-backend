# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.6'

gem 'aws-sdk-secretsmanager'
gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'mysql2', '~> 0.5'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.8', '>= 7.0.8.4'
gem 'ridgepole'
gem 'sprockets', '~> 3.7.2'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-thread_safety', require: false
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'ffaker', require: false
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end
