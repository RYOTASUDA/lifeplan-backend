# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    config.load_defaults 7.0

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja

    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.api_only = true
    Rails.application.credentials.config.each do |key, value|
      ENV[key.to_s.upcase] = value.to_s
    end
    if Rails.env.production?
      client = Aws::SecretsManager::Client.new(region: 'ap-northeast-1')
      get_secret_value_response =
        client.get_secret_value(secret_id: 'lifeplan-kanrikun')
      JSON.parse(get_secret_value_response.secret_string)
          .each { |key, value| ENV[key] = value }
    end
  end
end

setting_yaml = YAML.load_file("config/settings/#{Rails.env}.yml")
Settings = JSON.parse(
  setting_yaml.symbolize_keys.to_json,
  object_class: Struct.new(*setting_yaml.symbolize_keys.keys)
).freeze
