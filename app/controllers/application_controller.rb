class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Pagy::Backend

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t ".login_warning"
    redirect_to login_path
  end
end
