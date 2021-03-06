class Organization < ActiveRecord::Base
 
  # Associations
  has_many :users
  has_many :learning_spaces

  has_one    :account, :as => :accountable
  accepts_nested_attributes_for :account
  
  # Paperclip
  has_attached_file :logo, 
                    :styles => { :medium => "140x140>", :thumb => "35x35>" },
                    :default_url => '/assets/logos/default_:style.png',
                    :path => "/avatars/:style/:id/:filename",
                    :s3_permissions => :public_read
  
  # Accesible
  attr_accessible :name, :logo, :account_attributes
  
  # Callbacks
  before_create    :create_id_hash 
  before_create    { self.build_account }

  # Validations
  validates      :name, presence: true, length: { maximum: 50 }


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
