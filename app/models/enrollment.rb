class Enrollment < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :classroom
  belongs_to :course

  # Accesible
  attr_accessible :user_id, :course_id, :classroom_id, :state #ONLY FOR TESTING

  # Callbacks
  before_save   :create_id_hash
  
  # Validations
  validates :user_id, :course_id, :state, presence: true  
  validates :user_id, :uniqueness => { :scope => [:course_id, :classroom_id] }  

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
    self.id_hash = Digest::SHA2.hexdigest( self.user_id.to_s + self.course_id.to_s )[0..6]
  end

end
