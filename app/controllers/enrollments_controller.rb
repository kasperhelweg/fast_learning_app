class EnrollmentsController < ApplicationController

  def edit
    @enrollment = Enrollment.find_by_id_hash( params[:id] )
  end
  
  def update
    @enrollment = Enrollment.find_by_id_hash( params[:id] )
    #render 'edit'
    if @enrollment.update_attributes( params[:enrollment] )
      flash[:success] = "cool"      
      organization = current_user.organization
      redirect_to organization_path( organization )
    else
      render 'edit'
    end
  end
end
