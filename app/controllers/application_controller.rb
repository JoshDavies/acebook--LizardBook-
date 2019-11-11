class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  around_action :disable_override_to_param_user

  def no_current_user
    if !current_user
      render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def current_user
    session[:user_id]
  end

  def user_not_signed_in
    if !current_user
      redirect_to "/"
    end
  end

  def content_not_found
    render file: "#{Rails.root}/public/custom_404.html", layout: true, status: :not_found
  end

  # private

  def disable_override_to_param_user
    User.toggle_override_to_param(false)
    yield
    User.toggle_override_to_param(true)
  end
end
