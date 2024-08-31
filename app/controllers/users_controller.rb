# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: I18n.t('activerecord.request.created.success')
    else
      flash.now[:alert] = I18n.t('activerecord.request.created.failure')
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: I18n.t('activerecord.request.updated.success')
    else
      flash.now[:alert] = I18n.t('activerecord.request.updated.failure')
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
