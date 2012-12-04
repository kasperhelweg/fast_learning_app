class Order < ActiveRecord::Base
    # Associations
  has_many   :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, allow_destroy: true
  
  belongs_to :account

  # Accesible 
  attr_accessible   :line_items_attributes

  attr_accessor     :users

  # Callbacks
  before_create :create_id_hash

  state_machine :state, initial: :born do
    before_transition :completeable => :completed, :do => :complete_order

    event :do_initialize do
      transition :born => :initialized
    end

    event :confirm do
      transition :confirmable => :completeable
    end

    event :complete do
      transition :completeable => :completed
    end

    event :edit do
      transition :confirmable => :editable
    end

    event :next_state do
      transition :initialized => :confirmable
      transition :confirmable => :completeable
      transition :completeable => :completed     
    end

    event :previous_state do
      transition :confirmable => :editable
    end
  end  
  
  ##############################################################
  # Public interface
  ##############################################################
  
  def init
    users.each do |user|
      line_item = self.line_items.build
      line_item.user = user
      # Temporary
      line_item.product = Product.first
    end
  end

  def complete_order
    # First create invitations and activate users
    users.each do |user|
      self.transaction do
        user.enroll_in_course( Course.find(5) )
        user.activate
        user.invite!    
      end
    end
  end
    
  def switch( hash )
    hash.each {|method, proc| return proc[] if send method }
    yield if block_given?
  end
  
  
  ##############################################################
  # Private interface
  ##############################################################
  private
    
  def create_id_hash
    # self.id_hash = Digest::SHA2.hexdigest(  )[0..6]
  end

  

end
