class Account < ActiveRecord::Base
  
  # Associations
  belongs_to :accountable, :polymorphic => true
  has_many :orders
  
   # Accesible

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

