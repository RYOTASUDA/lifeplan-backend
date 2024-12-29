# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           Rails.application.credentials.google_client_id,
           Rails.application.credentials.google_client_secret,
           {
             callback_path: '/auth/google_oauth2/callback',
             request_path: '/auth/google_oauth2'
           }
end
OmniAuth.config.allowed_request_methods = %i[get post]
