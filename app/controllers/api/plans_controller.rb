# frozen_string_literal: true

module Api
  class PlansController < ApplicationController
    def index
      @all_plans = if to_underscore_params[:category_id].present?
                     current_user.plans
                                 .search_by_category(to_underscore_params[:category_id].to_i)
                                 .sort_by_deadline.group_by_year
                   else
                     current_user.plans.sort_by_deadline.group_by_year
                   end
    end

    def create
      plan = current_user.plans.build(plan_params)

      if plan.save
        render_success
      else
        render_bad_request_with_messages(plan.errors.full_messages)
      end
    end

    def update
      plan = current_user.plans.find(params[:id])

      if plan.update(plan_params)
        render_success
      else
        render_bad_request_with_messages(plan.errors.full_messages)
      end
    end

    def destroy
      plan = current_user.plans.find(params[:id])

      if plan.destroy
        render_success
      else
        render_bad_request_with_messages(plan.errors.full_messages)
      end
    end

    private

    def plan_params
      to_underscore_params.require(:plan).permit(:title, :deadline, :detail, :period_type,
                                                 :category_id)
    end
  end
end
