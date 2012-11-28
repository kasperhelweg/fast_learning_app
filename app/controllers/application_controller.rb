class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if current_user.role? :admin
      organization_path(current_user.organization)
    else
    current_user_path
    end
  end

end
