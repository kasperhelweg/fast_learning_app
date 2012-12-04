class CoursesController < ApplicationController
    respond_to :html, :xml, :json

  def index
    
    respond_with( @courses = Course.all )
  
  end
  
  def create
  end
  
  def new
  end
  
  def edit
  end

  def show
    
    respond_with( @course = Course.find_by_id_hash( params[:id] ) )
    
  end
  
  def update
  end
  
  def destroy
  end

end
