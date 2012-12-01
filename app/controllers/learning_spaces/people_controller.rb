class LearningSpaces::PeopleController < ApplicationController

  def new
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    @learning_space.build_users( 1 )     
  end

  def create
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] )
    params[:learning_space][:users_attributes].each do |users_attributes|
      user_attr = users_attributes[1]
      @learning_space.users.build( user_attr )  
    end
    
    if @learning_space.stage_users
      if @learning_space.save
        redirect_to current_user
      else
        render 'new'
      end
    else
      render 'new'
    end
  end
end
