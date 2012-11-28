class Profile < ActiveRecord::Base
  
  # Associations
  belongs_to :user
    
  # Accesible
  attr_accessible #none
  
  # Callbacks
  
  # Validations
  
  ##############################################################
  # Public interface
  ##############################################################
  
  ##############################################################
  # Private interface
  ##############################################################
  private

end
