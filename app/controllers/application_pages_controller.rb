class ApplicationPagesController < ApplicationController

  def show
    @page = ApplicationPage.find( params[:id] ).page
  end

end
