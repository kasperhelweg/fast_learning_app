class CourseGroups < ActiveRecord::Base
  
  # Associations
  belongs_to :learning_plan
  belongs_to :course
  attr_accessible #none
end
