class ApplicationController < ActionController::Base
  protect_from_forgery

  include OrdersHelper

  
  def after_sign_in_path_for( resource )
    if current_user.role? :admin
      
      organization = current_user.organization
      learning_space = organization.learning_spaces.first
      learning_space_path( organization, learning_space )
  
    else
      organization = current_user.organization
      organization_path( organization )
    end
  end

  # Here is probably a more accurate method
  
  #def after_sign_in_path_for( resource )
  #  if current_user.role? :super_user
  #    # Handle SuperUser
  #    current_user
  #  else
  #    organization = current_user.organization
  #    organization_path( organization )
  #  end
  #end
end
