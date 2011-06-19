class Api::UsersController < ApplicationController
  respond_to :json

  def create
    user = User.where(email: params[:user][:email]).first
    if user
      user = nil unless user.valid_password?(params[:user][:password])
    else
      user = User.create(params[:user]) unless user
    end

    if user
      render :json => "{\"auth_token\":\"#{user.authentication_token}\"}"
    else
      render :json => "ERROR", :status => :unprocessable_entity
    end
  end

end
