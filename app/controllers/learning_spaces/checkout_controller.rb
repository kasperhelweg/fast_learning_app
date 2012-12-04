class LearningSpaces::CheckoutController < ApplicationController

  def edit
    @order = Order.new
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    @staged_users = @learning_space.users.where( "state = ?", 'staged' )
    @formatted_hash = []
    if @staged_users.length > 0
      @organization = Organization.find_by_id_hash( params[:organization_id] )
      initialize_order
      if @order
        @order.init_products( @staged_users )
        
      end
      
    else
      redirect_to learning_space_path( @learning_space.organization, @learning_space)
    end

    #render 'new' -- !! RENDER CORRECT VIEW BASED ON ORDER STATE
  end

  def update
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id])
    @staged_users = @learning_space.users.where( "state = ?", 'staged' )
    @order = current_order
    if @order.complete!
      @staged_users.each do |user|
        user.enroll_in_course( Course.find(5) )
        user.activate
        user.invite!
      end
      redirect_to current_user
    end
  end
end
