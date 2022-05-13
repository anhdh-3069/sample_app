class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(edit update index destroy)
  before_action :correct_user, only: %i(edit update)

  def show
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_path
    flash[:danger] = t "shared.error_messages.no_info"
  end

  def new
    @user = User.new
  end

  def index
    @pagy, @users = pagy(User.all)
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "welcome to the sample app!"
      redirect_to @user
    else
      flash[:error] = "fail"
      flash[:success] = t "shared.error_messages.wellcome"
      redirect_to @user
    else
      flash[:danger] = t "shared.error_messages.created_fail"
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      flash[:success] = t ".edit_sussces"
      redirect_to @user
    else
      flash[:danger] = t ".edit_fail"
      render "edit"
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user&.destroy
      flash[:success] = "User deleted"
    else
      flash[:danger] = "Delete fail!"
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = "Please log in"
    redirect_to login_path
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end
end
