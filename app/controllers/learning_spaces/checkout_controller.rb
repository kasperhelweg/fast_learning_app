class LearningSpaces::CheckoutController < ApplicationController
  include OrdersHelper
  
  ##############################################################
  # Public interface
  ##############################################################
  
  def edit
    # Get organization and learningspace
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    
    # Let's try and initialize an order. If there is already an order in the session
    # or in the DB, we'll use that. Otherwise create a new one. The helper method is located
    # in orders_helper.rb
    begin
      @order = initialize_order    
    rescue
      # Handle exception
    ensure 
      do_show
    end
  end
  
  def update
    # Get organization and learningspace
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    # Get current order
    @order = current_order
    
    # Try to update the current_order.
    begin
      @order.update_attributes( params[:order] )
      @order.next_state
    rescue
      # Handle exception 
    ensure 
      do_show
    end
  end
  
  ##############################################################
  # Private interface
  ##############################################################
  private
  
  def do_show
    # Get the users staged for the current order. Maybe move this logic to the User model?
    @order.users = @learning_space.users.where( "state = ?", 'staged' )
    # Render depending on the state of the current_order instance
    @order.switch(
                  born?: -> { #Something wen't wrong 
                  },
                  initialized?: -> {
                    # Order ready for modification
                    @order.init                    
                    render '_edit'
                  },
                  editable?: -> {
                    # Order can be modified
                    render '_edit'
                  },              
                  confirmable?: -> {
                    # Order redy for confirmation 
                    render '_confirm'
                  },
                  completeable?: -> {
                    # Complete_order
                    if @order.complete!
                      session[:order_id] = nil
                      redirect_to learning_space_path( @organization, @learning_space )
                    else
                      # handle errors
                    end
                  },    
                  completed?: -> {
                    # Something is wrong
                    redirect_to learning_space_path( @organization, @learning_space )
                  }
                  ) { raise UnknownStateError.new } # Don't know what this error is?
  end
end
