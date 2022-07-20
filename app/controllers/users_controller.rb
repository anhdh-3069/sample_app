class UsersController < ApplicationController
  before_action :find_user, except: %i(index new create)
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)

  def index
    @pagy, @users = pagy User.all
  end

  def show
    @pagy, @microposts = pagy @user.microposts
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_mail_activate
      flash[:info] = t ".create_info"
      redirect_to login_url
    else
      flash[:danger] = t "shared.error_messages.created_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = t ".edit_sussces"
      redirect_to @user
    else
      flash[:danger] = t ".edit_fail"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end
    redirect_to users_url
  end

  def following
    @title = t ".following"
    @pagy, @users = pagy @user.following
    render :show_follow
  end

  def followers
    @title = t ".followers"
    @pagy, @users = pagy @user.followers
    render :show_follow
  end
  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    redirect_to root_path
    flash[:danger] = t "shared.error_messages.no_info"
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".login_warning"
    redirect_to login_path
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end
end
