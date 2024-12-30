module Api
  class ApplicationController < ActionController::API
    before_action :set_current_admin_user
    before_action :authenticate_admin_user

    def current_user
      return unless session[:user_id]

      User.find(session[:user_id])
    end

    def set_current_admin_user
      @current_user = current_user
    end

    def authenticate_admin_user
      redirect_to "#{ENV['FRONT_URL']}" if @current_admin_user.blank?
    end
  end
end
