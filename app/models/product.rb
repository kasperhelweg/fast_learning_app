class Product < ActiveRecord::Base
  # Associations
  belongs_to :buyable, :polymorphic => true
  has_many :line_items
  
  attr_accessible #none
end
