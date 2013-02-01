class UsersController < ApplicationController
  def new
  end

  def create
    password = params[:user].delete(:password)

    user = User.new(params[:user])
    user.password = password

    params[:user][:password] = password

    if user.save
      build_cookie(params)
    else
      flash.notice = user.errors.full_messages.first
      @session = User.new
      render 'sessions/new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @user = current_user
    redirect_to new_session_path unless cookies[:token] == @user.session_token
  end
end
