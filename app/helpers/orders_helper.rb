module OrdersHelper

  private
  def create_new_order
    order = @organization.account.orders.create! # Move logic to models
    session[:order_id] = order.id
  end
  
  def initialize_order
    order = Order.find_by_id( session[:order_id] )
    if !order || ( order.completed? )
      create_new_order
    else
      @order = order
    end
  end
  
  def current_order
    order = Order.find_by_id(session[:order_id])    
    
    if !order || order.completed?
      # Handle some error?
    end
    order
  end
end
