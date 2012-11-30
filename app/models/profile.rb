class Profile < ActiveRecord::Base
  
  # Associations
  belongs_to :user
  
  # Paperclip
  has_attached_file :avatar, 
                    :styles => { :medium => "140x140>", :thumb => "35x35>" },
                    :default_url => '/assets/avatars/default_:style.png',
                    :path => "/avatars/:style/:id/:filename",
                    :s3_permissions => :public_read

    
  # Accesible
  attr_accessible :avatar
  
  # Callbacks
  
  # Validations
  
  ##############################################################
  # Public interface
  ##############################################################
  
  ##############################################################
  # Private interface
  ##############################################################
  private

end
