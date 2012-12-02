class Course < ActiveRecord::Base
  # Associations
  has_many    :classrooms, :dependent => :destroy
  has_and_belongs_to_many :learning_plans

  has_many :course_groupings
  has_many :learning_plans, :through => :course_groupings

  # Accesible
  attr_accessible :desc, :short_desc, :title, :color
  
  # Callbacks
  before_save :create_id_hash
  
  # Validations
  validates :title, :color, :short_desc, :desc,  presence: true  
 
  ##############################################################
  # Public interface
  ##############################################################

  def to_param
    id_hash
  end
  
  ##############################################################
  # Private interface
  ##############################################################
  private
  
  def create_id_hash
    self.id_hash = Digest::SHA2.hexdigest(self.title)[0..6]
  end
end
