module Api
  class PlansController < ApplicationController
    def index
      @plans = current_user.plans.sort_by_deadline
    end
  end
end
