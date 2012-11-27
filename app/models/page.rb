class Page < ActiveRecord::Base

  # Associations
  belongs_to :pageable, :polymorphic => true
  
  # Accesible
  attr_accessible :title, :content
  
  # Callbacks
  
  # Validations

end
