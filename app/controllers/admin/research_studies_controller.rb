class Admin::ResearchStudiesController < Admin::AdminController

  def index
    @research_studies = ResearchStudy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @research_studies }
    end
  end

  def new
    @research_study = ResearchStudy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @research_study }
    end
  end

  def edit
    @research_study = ResearchStudy.find(params[:id])
  end

  def create
    @research_study = ResearchStudy.new(params[:research_study])

    respond_to do |format|
      if @research_study.save
        flash[:notice] = 'Research Study was successfully created.'
        format.html { redirect_to admin_research_studies_path }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @research_study = ResearchStudy.find(params[:id])

    respond_to do |format|
      if @research_study.update_attributes(params[:research_study])
        flash[:notice] = 'Research Study was successfully updated.'
        format.html { redirect_to admin_research_studies_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @research_study.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @research_study = ResearchStudy.find(params[:id])
    @research_study.destroy

    respond_to do |format|
      format.html { redirect_to(admin_research_studies_url) }
      format.xml  { head :ok }
    end
  end
end
