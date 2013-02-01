class SecretsController < ApplicationController
  def new
    @secret = Secret.new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.user_id = current_user.id
    if @secret.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @secret = Secret.find(params[:id])
    @secret.update_attributes(params[:secret])
    redirect_to user_path(current_user)
  end

  def edit
    @secret = Secret.find(params[:id])
  end

  def destroy
    @object = Secret.find(params[:id])
    @object.destroy
    redirect_to user_path(current_user)
  end

  def show
  end

  def index
  end
end
