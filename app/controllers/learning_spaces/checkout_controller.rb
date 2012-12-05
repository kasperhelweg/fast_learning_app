class LearningSpaces::CheckoutController < ApplicationController
  include OrdersHelper
    
  ##############################################################
  # Public interface
  ##############################################################

  def edit
    # First initialize current or new order.
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    
    @order = initialize_order    
    do_show
  end
  
  def update
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    @order = current_order
          
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
    @order.users = @learning_space.users.where( "state = ?", 'staged' )
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
