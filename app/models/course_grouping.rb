class CourseGrouping < ActiveRecord::Base
  
  # Associations
  belongs_to :learning_plan
  belongs_to :course
  attr_accessible #none
  
  # Accesible

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
