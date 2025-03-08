# frozen_string_literal: true

module Api
  class ApplicationController < ActionController::API
    before_action :set_current_user
    before_action :authenticate_user

    rescue_from(ActiveRecord::RecordInvalid) do |error|
      render_bad_request_with_messages([error.message])
    end
    rescue_from(ActiveRecord::RecordNotFound, with: :render_not_found_error)

    def current_user
      Rails.logger.info("session[:user_id]: #{session[:user_id]}")
      return unless session[:user_id]

      User.find(session[:user_id])
    end

    def set_current_user
      @current_user = current_user
    end

    def authenticate_user
      render_unauthorized if @current_user.blank?
    end

    def render_success
      render json: { message: 'Success' }
    end

    def render_unauthorized
      render json: { message: "You can't use service." }, status: :unauthorized
    end

    def render_bad_request_with_messages(messages)
      render json: { messages: }, status: :bad_request
    end

    def render_not_found_error
      render json: { message: 'Not found' }, status: :not_found
    end

    def to_underscore_params
      params.deep_transform_keys { _1.to_s.underscore }
    end
  end
end
