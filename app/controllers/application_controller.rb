class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for( resource )
    if current_user.role? :admin
      organization = current_user.organization
      learning_space = organization.learning_spaces.first
      organization_learning_space_path(
                                       organization, 
                                       learning_space 
                                       )
    else
    current_user_path
    end
  end

end
