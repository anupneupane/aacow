class Admin::EmploymentOpportunitiesController < Admin::AdminController
  
  # GET /opportunities
  # GET /opportunities.xml
  def index
    @employment_opportunities = EmploymentOpportunity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @opportunities }
    end
  end

  # GET /opportunities/1
  # GET /opportunities/1.xml
  def show
    @employment_opportunity = EmploymentOpportunity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @employment_opportunity }
    end
  end

  # GET /opportunities/new
  # GET /opportunities/new.xml
  def new
    @employment_opportunity = EmploymentOpportunity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @employment_opportunity }
    end
  end

  # GET /opportunities/1/edit
  def edit
    @employment_opportunity = EmploymentOpportunity.find(params[:id])
  end

  # POST /opportunities
  # POST /opportunities.xml
  def create
    @employment_opportunity = EmploymentOpportunity.new(params[:employment_opportunity])

    respond_to do |format|
      if @employment_opportunity.save
        flash[:notice] = 'Employment Opportunity was successfully created.'
        format.html { redirect_to admin_employment_opportunity_path(@employment_opportunity) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @employment_opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /opportunities/1
  # PUT /opportunities/1.xml
  def update
    @employment_opportunity = EmploymentOpportunity.find(params[:id])

    respond_to do |format|
      if @employment_opportunity.update_attributes(params[:employment_opportunity])
        flash[:notice] = 'Employment Opportunity was successfully updated.'
        format.html { redirect_to admin_employment_opportunity_path(@employment_opportunity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @employment_opportunity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /opportunities/1
  # DELETE /opportunities/1.xml
  def destroy
    @employment_opportunity = EmploymentOpportunity.find(params[:id])
    @employment_opportunity.destroy

    respond_to do |format|
      format.html { redirect_to(admin_employment_opportunities_url) }
      format.xml  { head :ok }
    end
  end
end
