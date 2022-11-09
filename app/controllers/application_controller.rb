# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization unless: :devise_controller?
  load_and_authorize_resource unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      if current_user.nil?
        format.html { redirect_to new_user_session_path, alert: 'You have to log in to continue.' }
      else
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
  end
end
