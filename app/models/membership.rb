class Membership < ActiveRecord::Base
  
  # Associations
  belongs_to :user
  belongs_to :learning_space
  
  # Accesible
  attr_accessible :admin, :learning_space_id # ONLY FOR TESTING
  
  # Callbacks
  before_save     :set_admin 

  # Validations
  validates_uniqueness_of :user_id, :scope => :learning_space_id

  ##############################################################
  # Public interface
  ##############################################################

  ##############################################################
  # Private interface
  ##############################################################
  private

  def set_admin
    self.admin = self.user._admin_for_space
  end
end
