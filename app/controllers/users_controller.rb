class UsersController < ApplicationController

  def show
  end

  def edit
    @person = current_user
  end
  
  def update
    # Resource already loaded
    @person = current_user
    if @person.update_attributes( params[:user] )
      sign_in @person
      flash[:success] = "profil opdateret"      
      redirect_to current_user 
    else
      render 'edit'
    end
  end
  
end
