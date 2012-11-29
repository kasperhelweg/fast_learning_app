class Classroom < ActiveRecord::Base
  
  # Associations 
  has_many :enrollments
  has_many :users, :through => :enrollments
  
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
  
end
