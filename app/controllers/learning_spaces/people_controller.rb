class LearningSpaces::PeopleController < ApplicationController

  def new
    # Get current learningspace and build a default user.
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    @learning_space.build_users( 1 )     
  end
  
  def create
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] )
    if @learning_space.update_attributes( params[:learning_space] )
      # INVITE USERS!
      flash[:success] = "People added"     
      redirect_to learning_space_checkout_path( @learning_space.organization, @learning_space)
    else
      render 'new'
    end
  end
end
