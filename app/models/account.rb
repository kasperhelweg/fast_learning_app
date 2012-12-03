class Account < ActiveRecord::Base
  
  # Associations
  belongs_to :accountable, :polymorphic => true
  has_many :orders
  
end
