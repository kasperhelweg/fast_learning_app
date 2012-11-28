class LearningSpaces::PeopleController < ApplicationController

  def new
    @LearningSpace = LearningSpace.find_by_id_hash( params[:learning_space_id] ) 
  end

end
