class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Associations
  belongs_to                    :organization
  accepts_nested_attributes_for :organization
  
  has_one                       :profile
  accepts_nested_attributes_for :profile

  has_many                      :memberships
  has_many                      :learning_spaces, :through => :memberships
  

  has_many                      :enrollments
  has_many                      :classrooms,      :through => :enrollments

  # Accesible
  attr_accessible               :name, :email, :password, :password_confirmation, :remember_me, :skip_invitation, :profile_attributes, :organization_attributes, :admin_for_space
  attr_accessor                 :name_required, :admin_for_space
  
  # Callbacks
  after_initialize { set_name_required( true ) }
  before_create    { set_state( 'born' ) }
    
  before_save    :create_id_hash
  before_save    :fix_name
  
  # Validations
  validates       :name, presence: true, length: { maximum: 50 }, :if => lambda{ self.name_required? }

  ##############################################################
  # Public interface
  ##############################################################

  def to_param
    id_hash
  end
  
  def role?( role )
    return role.to_s.camelize == self.role
  end

  # Devise
  def attempt_setup_user( params )
    
    self.build_profile
    self.build_organization
    self.role = "Admin"
    
    u = {}
    u[:password] = params[:password]
    u[:password_confirmation] = params[:password_confirmation]
    u[:organization_attributes] = params[:organization_attributes]
    
    if update_attributes( u )
      self.organization.learning_spaces.create(name: "default_space")
    end
  end
  
  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end
  
  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  def name_required?
    self.name_required
  end
  
  ##############################################################
  # Private interface
  ##############################################################
  private

  
  def set_name_required( b )
    self.name_required = b
  end

  # Temporary function
  def set_state( state )
    self.state = state
  end
  
  def create_id_hash
    self.id_hash = Digest::SHA2.hexdigest( self.email )[0..6]
  end
  
  def downcase_email
    self.email = self.email.downcase
  end
  
  def fix_name
    self.name = construct_name( self.name.split )
  end
  
  def construct_name( name )
    if name.length == 0
      return ""
    elsif name.length == 1
      return name.shift.capitalize
    else
      name.shift.capitalize + " " + construct_name( name )
    end
  end 
end
