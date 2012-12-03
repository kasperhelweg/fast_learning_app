class LearningSpaces::PeopleController < ApplicationController

  def new
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    @learning_space.build_users( 1 )     
  end

  def create
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] )
    if @learning_space.update_attributes( params[:learning_space] )
      #user.invite!
      flash[:success] = "People added"     
      redirect_to current_user
    else
      render 'new'
    end
    #params[:learning_space][:users_attributes].each do |users_attributes|
    #  user_attr = users_attributes[1]
    #  user = @learning_space.users.build( user_attr )  
    #  user.stage( @learning_space.organization )
    #  user_count = user_count + 1
    #end
  end
end
