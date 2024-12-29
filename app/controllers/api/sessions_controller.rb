# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    skip_before_action :authenticate_request, only: [:create]

    def create # rubocop:disable Metrics/AbcSize
      frontend_url = Rails.configuration.allow_origins.first
      user_info = request.env['omniauth.auth']
      google_user_id = user_info['uid']
      provider = user_info['provider']
      token = generate_token_with_google_user_id(google_user_id, provider)

      user_authentication = UserAuthentication.find_by(uid: google_user_id, provider:)

      unless user_authentication
        user = User.create(name: user_info['info']['name'], email: user_info['info']['email'])
        UserAuthentication.create(user_id: user.id, uid: google_user_id, provider:)
      end
      redirect_to "#{frontend_url}?token=#{token}", allow_other_host: true
    end

    private

    def generate_token_with_google_user_id(google_user_id, provider)
      exp = Time.now.to_i + (24 * 3600)
      payload = { google_user_id:, provider:, exp: }
      hmac_secret = ENV.fetch('JWT_SECRET_KEY', nil)
      JWT.encode(payload, hmac_secret, 'HS256')
    end
  end
end
