class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    redirect_to root_path unless @user
    flash[:danger] = @user.errors.full_messages.to_sentence
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_parmas
    if @user.save
      flash[:success] = t "shared.error_messages.wellcome"
      redirect_to @user
    else
      flash[:danger] =  "Taọ taì khoản thất baị"
      render :new
    end
  end

  private
  def user_parmas
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end
end
