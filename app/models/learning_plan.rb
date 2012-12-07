class LearningPlan < ActiveRecord::Base
  # Associaltions
  has_many :course_groupings
  has_many :courses, :through => :course_groupings
  
  has_many :products, :as => :buyable
  
  # Accesible
  attr_accessible :title

  # Callbacks
  before_save :create_id_hash

  # Validations
  
  ##############################################################
  # Public interface
  ##############################################################
 
  ##############################################################
  # Private interface
  ##############################################################
  private

  def create_id_hash
    unique_string = self.title
    self.id_hash = Digest::SHA2.hexdigest(unique_string)[0..6]
  end
end
