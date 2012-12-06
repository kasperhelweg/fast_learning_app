class Product < ActiveRecord::Base
  
  # Associations
  belongs_to :buyable, :polymorphic => true
  has_many :line_items
  
  # Accesible
  attr_accessible #none
  
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
