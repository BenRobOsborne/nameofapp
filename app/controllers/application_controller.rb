class ApplicationController < ActionController::Base

  
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to main_app.root_url
  end

  add_flash_types :danger, :info, :warning, :success
end
