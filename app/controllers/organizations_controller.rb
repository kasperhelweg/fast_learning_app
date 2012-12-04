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
  end
end
