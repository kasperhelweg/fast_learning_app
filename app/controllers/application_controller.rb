class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for( resource )
    if current_user.role? :super_user
      # Handle SuperUser
      current_user
    else
      organization = current_user.organization
      organization_path( organization )
    end
  end

end
