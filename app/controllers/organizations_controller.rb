class OrganizationsController < ApplicationController
  
  def show
    @organization = Organization.find_by_id_hash( params[:id] )
    @learning_spaces = @organization.learning_spaces.all
  end

  def edit
    @organization = Organization.find_by_id_hash( params[:id] )
    @account = @organization.account
  end

  def update
    organization = current_user.organization
    learning_space = organization.learning_spaces.first
    redirect_to learning_space_path( organization, learning_space ) 
  end
end
