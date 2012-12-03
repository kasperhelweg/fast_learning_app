class LineItem < ActiveRecord::Base
  
  # Associations
  belongs_to     :order
  belongs_to     :product
  belongs_to     :user       
  
  attr_accessible :product_id 
end
