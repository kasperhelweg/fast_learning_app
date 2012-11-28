class LearningSpaces::PeopleController < ApplicationController

  def new
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    1.times do
      @learning_space.users.build
    end
  end

  def create
    @learning_space = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
    if @learning_space.users.create( params[:learning_space][:users_attributes][:user] )
      flash[:success] = "Learners staged!"
      redirect_to current_user
    else
      render 'new'
    end
  end
  
end
