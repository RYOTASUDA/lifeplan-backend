module Api
  class SessionsController < ApplicationController
    skip_before_action :authenticate_admin_user, only: %i[google_oauth2_callback]

    def destroy
      session[:user_id] = nil
      redirect_to "#{ENV['FRONT_URL']}", notice: 'ログアウトしました'
    end

    def google_oauth2_callback
      user = User.find_or_initialize_by_google_oauth(request.env['omniauth.auth']['info'])

      if user.new_record? && !user.save
        return redirect_to  "#{ENV['FRONT_URL']}", alert: 'ユーザー作成に失敗しました'
      end

      session[:user_id] = user.id
      redirect_to "#{ENV['FRONT_URL']}", notice: 'ログインしました'
    end
  end
end
