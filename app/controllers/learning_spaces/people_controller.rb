class LearningSpaces::PeopleController < ApplicationController

  def new
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    @learning_space.build_users( 1 )     
  end

  def create
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] )
    params[:learning_space][:memberships_attributes].each do |membership_attributes|
      
      man_attr = membership_attributes[1]      
      user_attr = membership_attributes[1][:user_attributes]      
      
      membership = @learning_space.memberships.build( man_attr )
      user = membership.build_user( user_attr )

    end

    if @learning_space.valid?
      if @learning_space.stage_users
        redirect_to current_user
      else
        render 'new'
      end
    else
      render 'new'
    end
  end
end
