class CourseGrouping < ActiveRecord::Base
  
  # Associations
  belongs_to :learning_plan
  belongs_to :course
    
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
