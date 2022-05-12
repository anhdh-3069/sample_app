class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_path
    flash[:danger] = t "shared.error_messages.no_info"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_parmas
    if @user.save
      log_in @user
      flash[:success] = t "shared.error_messages.wellcome"
      redirect_to @user
    else
      flash[:danger] = t "shared.error_messages.created_fail"
      render :new
    end
  end

  private
  def user_parmas
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end
end
