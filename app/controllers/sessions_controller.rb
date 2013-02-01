class SessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    build_cookie(params)
  end

  def destroy
    user = User.find(cookies[:user_id])
    user.session_token = nil
    user.save!

    cookies[:token] = nil

    redirect_to new_session_path
  end
end
