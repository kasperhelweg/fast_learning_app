class LearningSpaces::CheckoutController < ApplicationController
  include OrdersHelper
    
  ##############################################################
  # Public interface
  ##############################################################

  def edit
    # Very temporary code !!!
    # First initialize current or new order.
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    
    @order = initialize_order    
    do_show
  end
  
  def update
    ## Crazy code
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    @order = current_order

    # @staged_users = @learning_space.users.where( "state = ?", 'staged' )
    # @order.init( @staged_users ) 
                
    if @order.update_attributes( params[:order] )
      @order.next_state
      do_show
    else
      do_show
    end
  end
    
  ##############################################################
  # Private interface
  ##############################################################
  private

  def do_show
    @order.switch(
                  born?: -> { #Something wen't wrong 
                  },
                  initialized?: -> {
                    # Order ready for modification
                    @staged_users = @learning_space.users.where( "state = ?", 'staged' )
                    @order.init( @staged_users ) 
                    render '_edit'
                  },
                  editable?: -> {
                    # Order can be modified
                    render '_edit'
                  },              
                  confirmable?: -> {
                    # Order redy for confirmation 
                    @staged_users = @learning_space.users.where( "state = ?", 'staged' )
                    render '_confirm'
                  },
                  completeable?: -> {
                    # Complete_order
                    if @order.complete!
                      redirect_to current_user
                    else
                      # handle errors
                    end
                  },    
                  completed?: -> {
                    # Something is wrong
                    redirect_to current_user
                  }
                  ) { raise UnknownStateError.new } # Don't know what this error is?
  end
end
