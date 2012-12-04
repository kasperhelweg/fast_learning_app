module OrdersHelper

  private
  
  def create_new_order
    order = @organization.account.orders.create! # Move logic to models
    if order.initialize
      session[:order_id] = order.id
    else
      # Handle error
    end
    order
  end
  
  def initialize_order
    order = Order.find_by_id( session[:order_id] )
    if !order || ( order.completed? )
      create_new_order
    else
      order
    end
  end
  
  def current_order
    order = Order.find_by_id(session[:order_id])        
    if !order || order.completed?
      false
    end
    order
  end
end
