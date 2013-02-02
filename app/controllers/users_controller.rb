class UsersController < ApplicationController
  def new
  end

  def create
    password = params[:user].delete(:password)

    user = User.new(params[:user])
    user.password = password

    params[:user][:password] = password

    if user.save
      UserMailer.confirmation_email(user).deliver
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

  def reset_pwd
    @user = User.new
  end

  def reset_pwd_for_user
    puts "X"*1000
    user = User.find_by_email(params[:user][:email])

    new_pass = user.reset_pwd

    UserMailer.reset_email(user, new_pass).deliver

    @session = User.new
    render 'sessions/new'
  end
end
