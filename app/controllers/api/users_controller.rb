# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def show
      @current_user
    end
  end
end
