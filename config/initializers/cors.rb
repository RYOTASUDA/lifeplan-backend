# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins Rails.configuration.allow_origins
    resource '*',
             headers: :any,
             methods: %i[get post put delete],
             credentials: true
  end
end
