class Resource < ActiveRecord::Base
  # Associations
  belongs_to :attachable, :polymorphic => true
  
  # Accesbile
  attr_accessible :resource
 
  # Paperclip
  has_attached_file :resource,
                    :s3_permissions => :public_read

  # Validations
  validates :resource, presence: true  

end
