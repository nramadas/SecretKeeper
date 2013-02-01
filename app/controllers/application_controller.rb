class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    current_user = User.find(cookies[:user_id])
  end

  def build_cookie(params)
    user = User.find_by_email(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      token = SecureRandom.uuid
      cookies[:user_id] = user.id
      cookies[:token] = token
      user.session_token = token

      user.save!
      redirect_to user_path(user), notice: 'Logged in'
    else
      flash.notice = user.errors.full_messages.first
      @session = User.new
      render 'sessions/new'
    end
  end
end
