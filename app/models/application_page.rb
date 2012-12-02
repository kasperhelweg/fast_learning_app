class ApplicationPage < ActiveRecord::Base

  # Associations
  has_one :page, :as => :pageable

  # Accesible
  attr_accessible :location
  
  # Callbacks

  # Validations
end
