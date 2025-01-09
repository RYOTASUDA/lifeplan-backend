# frozen_string_literal: true

module Api
  class CategoriesController < ApplicationController
    def index
      @categories = current_user.categories
    end

    def edit
      @category = current_user.categories.find(params[:id])
    end

    def create
      category = current_user.categories.new(category_params)

      if category.save
        render_success
      else
        render_bad_request_with_messages(category.errors.full_messages)
      end
    end

    def update
      category = current_user.categories.find(params[:id])

      if category.update(category_params)
        render_success
      else
        render_bad_request_with_messages(category.errors.full_messages)
      end
    end

    def destroy
      category = current_user.categories.find(params[:id])

      if category.destroy
        render_success
      else
        render_bad_request_with_messages(category.errors.full_messages)
      end
    end

    private

    def category_params
      to_underscore_params.require(:category).permit(:name, :color)
    end
  end
end
