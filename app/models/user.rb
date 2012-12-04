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

  has_one    :account, :as => :accountable

  has_many                      :memberships
  has_many                      :learning_spaces, :through => :memberships
  

  has_many                      :enrollments
  has_many                      :classrooms,      :through => :enrollments

  # Accesible
  attr_accessible               :name, :email, :password, :password_confirmation, :remember_me, 
                                :skip_invitation, :profile_attributes, :organization_attributes, :_organization_id, :_admin_for_space, :_scope
  
  attr_accessor                 :name_required, :_admin_for_space, :_organization_id, :_first_record, :_scope
  
  # Callbacks
  after_initialize { set_name_required( true ) }
    
  before_save     :create_id_hash
  before_save     :fix_name
  
  before_save      :stage, :if => lambda{ self._scope == :learningspace.to_s }
  
  # Validations
  validates       :name, presence: true, length: { maximum: 50 }, :if => lambda{ self.name_required? }
  
  
  state_machine :state, initial: :born do
    
    event :activate do
      transition :born => :active
      transition :staged => :active
    end
    event :stage do
      transition :born => :staged
    end
  end
  
  ##############################################################
  # Public interface
  ##############################################################

  def to_param
    id_hash
  end

  def first_record?
    self._first_record
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
      self.activate
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

  def stage
    self.skip_confirmation!       
    self.build_profile
    self.organization = Organization.find( self._organization_id )
    self.role = "User"
    self.state = "staged"
  end

  def enroll_in_course( course )
    enrollment = self.enrollments.new
    enrollment.state = 'invited'
    enrollment.course = course
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
