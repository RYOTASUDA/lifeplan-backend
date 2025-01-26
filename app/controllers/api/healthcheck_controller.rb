# frozen_string_literal: true

# healthcheck for alb
module Api
  class HealthcheckController < ApplicationController
    def show
      head :ok
    end
  end
end
