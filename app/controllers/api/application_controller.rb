# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    before_action :set_current_user
    before_action :authenticate_user

    def current_user
      return unless session[:user_id]

      User.find(session[:user_id])
    end

    def set_current_user
      @current_user = current_user
    end

    def authenticate_user
      render_unauthorized if @current_user.blank?
    end

    def render_unauthorized
      render json: { message: "You can't use service." }, status: :unauthorized
    end
  end
end
