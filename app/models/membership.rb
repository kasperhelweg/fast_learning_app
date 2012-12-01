class Membership < ActiveRecord::Base
  
  # Associations
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :learning_space
  
  
    
  # Accesible
  attr_accessible :user_attributes, :admin # ONLY FOR TESTING
  
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
