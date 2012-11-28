class LearningSpacesController < ApplicationController

  def show
    @Organization = Organization.find_by_id_hash(params[:organization_id])
    @LearningSpace = LearningSpace.find_by_id_hash(params[:id])
    
   
  end

end
