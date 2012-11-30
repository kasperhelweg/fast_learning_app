class LearningSpacesController < ApplicationController

  def show
    @organization = Organization.find_by_id_hash( params[:organization_id] )
    @learning_space = LearningSpace.find_by_id_hash( params[:id] )
  end

end
