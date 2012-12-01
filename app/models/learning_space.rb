class LearningSpace < ActiveRecord::Base
  
  # Associations
  belongs_to :organization
  
  has_many :memberships
  has_many :users, :through => :memberships
  accepts_nested_attributes_for :memberships
  
  # Accesible
  attr_accessible :name, :memberships_attributes
    
  # Callbacks
  before_save   :create_id_hash

  # Validations

  ##############################################################
  # Public interface
  ##############################################################
  
  def to_param
    id_hash
  end

  def stage_users
    self.transaction do
      self.memberships.each do |membership|
        if membership.new_record?
          user = membership.user
          user.organization = self.organization
          user.skip_confirmation!       
          user.state = 'staged'
          user.role = "user"
          user.save
        end
      end   
      self.save!
    end
  end

  def build_users( n )
    n.times do
      self.memberships.build.build_user
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
