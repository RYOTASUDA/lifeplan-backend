# frozen_string_literal: true

# healthcheck for alb
module Api
  class HealthcheckController < ApplicationController
    skip_before_action :set_current_user
    skip_before_action :authenticate_user

    def show
      head :ok
    end
  end
end
