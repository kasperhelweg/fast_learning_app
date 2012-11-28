class OrganizationsController < ApplicationController
  
  def show
    @Organization = Organization.find_by_id_hash( params[:id] )
    @LearningSpaces = @Organization.learning_spaces.all
  end

end
