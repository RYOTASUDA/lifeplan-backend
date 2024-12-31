# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: %i[google_oauth2_callback]

    def destroy
      session[:user_id] = nil

      render json: { message: 'Logout successfully.' }
    end

    def google_oauth2_callback
      user = User.find_or_initialize_by_google_oauth(request.env['omniauth.auth']['info'])

      unless user.new_record? && !user.save
        session[:user_id] = user.id
        Category.create_default_categories(user)
      end

      redirect_to ENV.fetch('FRONT_URL', nil)
    end
  end
end
