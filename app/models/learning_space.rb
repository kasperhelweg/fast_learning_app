class LearningSpace < ActiveRecord::Base
  
  # Associations
  belongs_to :organization
  
  has_many :memberships
  has_many :users, :through => :memberships
  accepts_nested_attributes_for :users, :allow_destroy => true, 
                                        :reject_if => 
                                        lambda{ |attributes| 
                                        ( attributes[:name].blank? && attributes[:email].blank? ) && attributes[:_first_record] != :true.to_s  }
    
  # Accesible
  attr_accessible :name, :users_attributes
    
  # Callbacks
  before_save   :create_id_hash

  # Validations

  ##############################################################
  # Public interface
  ##############################################################
  
  def to_param
    id_hash
  end

  def build_users( n )
    n.times do
      user = self.users.build
      user.memberships.build
    end
  end

  ##############################################################
  # Private interface
  ##############################################################
  private
  
  def create_id_hash
    self.id_hash = Digest::SHA2.hexdigest( self.organization.id_hash + "." + self.name )[0..6]
  end
  
end
