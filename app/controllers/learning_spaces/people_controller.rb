class LearningSpaces::PeopleController < ApplicationController

  def new
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    @learning_space.build_users( 1 )     
    
  end

  def create
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 

    # Also set ROLE using dyn. attr_accesible
    params[:learning_space][:users_attributes].each do |user|
      user = @learning_space.users.build(name: user[1]['name'], email: user[1]['email'])
      user.organization = @learning_space.organization
    end
    if @learning_space.valid?
      if @learning_space.invite_users
        flash[:success] = "Learners staged!"
        redirect_to current_user
      else
        render 'new'
      end
    else
      render 'new'
    end
  end
end
