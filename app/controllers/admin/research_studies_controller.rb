class Admin::ResearchStudiesController < Admin::AdminController

  # GET /opportunities
  # GET /opportunities.xml
  def index
    @research_studies = ResearchStudy.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @research_studies }
    end
  end

  # GET /opportunities/1
  # GET /opportunities/1.xml
  def show
    @research_study = ResearchStudy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @research_study }
    end
  end

  # GET /opportunities/new
  # GET /opportunities/new.xml
  def new
    @research_study = ResearchStudy.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @research_study }
    end
  end

  # GET /opportunities/1/edit
  def edit
    @research_study = ResearchStudy.find(params[:id])
  end

  # POST /opportunities
  # POST /opportunities.xml
  def create
    @research_study = ResearchStudy.new(params[:research_study])

    respond_to do |format|
      if @research_study.save
        flash[:notice] = 'Research Study was successfully created.'
        format.html { redirect_to admin_research_study_path(@research_study) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /opportunities/1
  # PUT /opportunities/1.xml
  def update
    @research_study = ResearchStudy.find(params[:id])

    respond_to do |format|
      if @research_study.update_attributes(params[:research_study])
        flash[:notice] = 'Research Study was successfully updated.'
        format.html { redirect_to admin_research_study_path(@research_study) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @research_study.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.xml
  def destroy
    @research_study = ResearchStudy.find(params[:id])
    @research_study.destroy

    respond_to do |format|
      format.html { redirect_to(admin_research_studies_url) }
      format.xml  { head :ok }
    end
  end
end
