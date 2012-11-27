class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Associations
  belongs_to :organization
  
  # Accesible
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
  # Callbacks
  before_create   :create_id_hash
  before_save     :fix_name

  # Validations
  
  ##############################################################
  # Public interface
  ##############################################################

  def role?( role )
    return role.to_s.camelize == self.role
  end
  
  ##############################################################
  # Private interface
  ##############################################################
  private

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
