# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           ENV.fetch('GOOGLE_CLIENT_ID', nil),
           ENV.fetch('GOOGLE_CLIENT_SECRET', nil)
end
OmniAuth.config.allowed_request_methods = %i[get]
OmniAuth.config.silence_get_warning = true
