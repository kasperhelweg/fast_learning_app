class Organization < ActiveRecord::Base
 
  # Associations
  has_many :users

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
    self.id_hash = Digest::SHA2.hexdigest( self.name )[0..6]
  end
  
end
