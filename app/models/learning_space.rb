class LearningSpace < ActiveRecord::Base
  
  # Associations
  belongs_to :organization
  
  has_many :memberships
  has_many :users, :through => :memberships

    
  # Accesible
  attr_accessible :name
  
  # Callbacks
  before_create   :create_id_hash

  # Validations

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
    self.id_hash = Digest::SHA2.hexdigest( self.organization.id_hash + "." + self.name )[0..6]
  end
  

end
