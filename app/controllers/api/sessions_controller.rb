# frozen_string_literal: true

module Api
  class SessionsController < ApplicationController
    skip_before_action :authenticate_user, only: %i[google_oauth2_callback]

    def destroy
      session[:user_id] = nil

      render json: { message: 'Logout successfully.' }
    end

    def google_oauth2_callback
      user = User.find_or_initialize_by_email(request.env['omniauth.auth']['info']['email'])

      user.assign_attributes(name: request.env['omniauth.auth']['info']['name'])

      initialize_default_categories(user) if user.new_record?

      user.save!

      session[:user_id] = user.id if user.present?

      redirect_to Settings.frontend_url, allow_other_host: true
    end

    private

    def initialize_default_categories(user)
      Category::DEFAULT_CATEGORIES.each do |category|
        user.categories.build(name: category[:name], color: category[:color])
      end
    end
  end
end
