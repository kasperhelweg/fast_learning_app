class Membership < ActiveRecord::Base
  
  # Associations
  belongs_to :user
  belongs_to :learning_space
    
  # Accesible
  attr_accessible #none
  
  # Callbacks
  
  # Validations
  validates_uniqueness_of :user_id, :scope => :learning_space_id

  ##############################################################
  # Public interface
  ##############################################################
    
  ##############################################################
  # Private interface
  ##############################################################
  private

end
