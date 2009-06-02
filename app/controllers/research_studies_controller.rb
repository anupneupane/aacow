class ResearchStudiesController < ApplicationController
  
  def index
    options = { :page => params[:page], :per_page => 10, :conditions => @conditions}
    @research_studies = model_name.constantize.paginate options
  end
  
  def show
  end
  
  def model_name
    controller_name.singularize.camelize
  end
  
end
