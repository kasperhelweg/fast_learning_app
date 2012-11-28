class LearningSpace < ActiveRecord::Base
  
  # Associations
  belongs_to :organization
  
  has_many :memberships
  has_many :users, :through => :memberships
  accepts_nested_attributes_for :users

    
  # Accesible
  attr_accessible :name, :users_attributes
    
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
