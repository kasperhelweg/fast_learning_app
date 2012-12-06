class LineItem < ActiveRecord::Base
  
  # Associations
  belongs_to     :order
  belongs_to     :product
  belongs_to     :user       
  
  # Accesible
  attr_accessible :product_id, :user_id 

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
