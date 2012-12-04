class Order < ActiveRecord::Base
    # Associations
  has_many   :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, allow_destroy: true
  
  belongs_to :account

  # Accesible 
  attr_accessible   :line_items_attributes

  # Callbacks
  before_create :create_id_hash

  state_machine :state, initial: :born do
    event :initialize do
      transition :born => :initialized
    end
    event :complete do
      transition :born => :completed
    end
 
  end  
  
  ##############################################################
  # Public interface
  ##############################################################
  
  
  def init_products( users )
    #users = get_users
    users.each do |user|
      if !LineItem.find_by_user_id( user.id )
        item_01 = self.line_items.build
        item_01.user = user
        item_01.product = Product.first
      end
    end
  end

  def complete_order
    # First create invitations and activate users
    users = get_users
    users.each do |user|
      user.enroll_in_course( Course.first )
      user.activate
      user.invite!
      #line_items_for_user = user.get_line_items_for_user( user )
      #line_items_for_user.each do |line_item|
      
      #end
    end
    self.state = 'complete'
  end
  
  
  ##############################################################
  # Private interface
  ##############################################################
  private
    
  def create_id_hash
    # self.id_hash = Digest::SHA2.hexdigest(  )[0..6]
  end


end
