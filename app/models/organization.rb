class Organization < ActiveRecord::Base
 
  # Associations
  has_many :users

  # Accesible
  attr_accessible :name
  
  # Callbacks

  # Validations
    
end
