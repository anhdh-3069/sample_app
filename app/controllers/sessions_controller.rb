class SessionsController < ApplicationController
  before_action :find_by_email, only: :create

  def create
    if @user&.authenticate params[:session][:password]
      user_activated
    else
      flash.now[:danger] = t ".controller.error"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  private
  def find_by_email
    @user = User.find_by email: params.dig(:session, :email)&.downcase
    return if @user

    flash[:danger] = t ".controller.find_error"
    redirect_to root_path
  end

  def user_activated
    if @user.activated?
      log_in @user
      params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
      redirect_back_or @user
    else
      message = t ".controller.flash_warning"
      flash[:warning] = message
      redirect_to root_url
    end
  end
end
