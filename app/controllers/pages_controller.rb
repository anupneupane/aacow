class PagesController < ApplicationController
  
  require 'rubygems'
  require 'hpricot'
  require 'mechanize'
  require 'uri'
  WWW::Mechanize.html_parser = Hpricot
   
  def index
    @pollen_count = PollenCount.find(:first, :order => 'date desc')
    if params[:pollen_count] == 'trees'
      count = @pollen_count.trees/1500.to_f 
    elsif params[:pollen_count] == 'weeds'
      count = @pollen_count.weeds/500.to_f
    elsif params[:pollen_count] == 'fungi'
      count = @pollen_count.fungi/50000.to_f 
    elsif params[:pollen_count] == 'grass'
      count = @pollen_count.grass/200.to_f
    else
      count = @pollen_count.trees/1500.to_f
    end
    respond_to do |page|
      page.html { @graph =  Gchart.meter(:data => [count * 100], :encoding => 'text', :size => '264x210', :bar_colors => ['00FF00', 'FFFF00', 'FF0000']) }
    end
  end
  
  def graph_code
    @pollen_count = PollenCount.find(:first, :order => 'date desc')
    #bar = BarGlass.new
    bar.on_click = "alert('hello there')"
    bar.set_values((1..9).to_a)
    @values = [@pollen_count.grass, @pollen_count.trees, @pollen_count.weeds, @pollen_count.fungi]
    @values = @values.select{|v| !v.zero?}
    bar.values  = @values
    
    #chart = OpenFlashChart.new
    chart.bg_colour = '#FFFFFF'
    chart.add_element(bar)
    
    chart.x_axis = nil
    
    render :text => chart.to_s
  end
  
  def get_pollen_count
    @elements=[]
    agent = WWW::Mechanize.new
    agent.keep_alive = false # true causes TypeError
    page = agent.get('http://www.aaaai.org/nab/collectors/index.cfm')
    page = page.form_with(:action => 'index.cfm?p=start') do |f|
      f['LIusername'] = 'pdaftary'
      f['LIpassword'] = 'ffw242'
    end.click_button
    page = page.parser { |f| Hpricot f, :xhtml_strict => true }
    page = (page/'table[3]/tr/td').first
    page = (page/'table/tr')
    page = page[4..page.size].each do |val|
      day = (val/'td').first.inner_html
      grass = (val/'td')[1].inner_html
      trees = (val/'td')[2].inner_html
      weeds = (val/'td')[3].inner_html
      fungi = (val/'td')[4].inner_html
      PollenCount.create(:date => Date.parse(day), :grass => grass, :trees => trees, :weeds => weeds, :fungi => fungi)
    end 
  end
  
  
  def show

  end
  
  def send_contact_form
    Pony.mail :to => params[:contact][:to_field],
        :from => params[:contact][:author_email],
        :subject => 'Contact form sent',
        :body => body

    flash[:notice] = "Thanks for sending us a message."
    redirect_to :back
  end
  
  def send_satisfaction_survey
    Pony.mail :to => 'jhblacklock@gmail.com',
        :from => params[:survey][:author_email],
        :subject => 'Survey from AACOW',
        :body => survey_body

    flash[:notice] = "Thanks for sending us a message."
    redirect_to :back
  end
  
  def body
    
    body = "YOU GOT A MESSAGE FROM AACOW.COM \n\n" +

    			"NAME: #{params[:contact][:author] } \n\n" +

    			"E MAIL: #{params[:contact][:author_email]} \n\n" +

    			"Message: #{params[:contact][:body]} \n\n"
      return body
  end
  
  def survey_body
    body = "YOU GOT A SURVEY FROM AACOW.COM \n\n" +

    			"NAME: #{params[:survey][:author] } \n\n" +
    			
    			"PHONE: #{params[:survey][:author_phone] } \n\n" +
    			
    			"ADDRESS 1: #{params[:survey][:author_address_1] } \n\n" +
    			
    			"ADDRESS 2: #{params[:survey][:author_address_2] } \n\n" +
    			
    			"CITY: #{params[:survey][:author_city] } \n\n" +
    			
    			"STATE: #{params[:survey][:author_state] } \n\n" +
    			
    			"ZIP: #{params[:survey][:author_zip] } \n\n" +

    			"E MAIL: #{params[:survey][:author_email]} \n\n" +
    			
    			"Date of Appointment: #{params[:date][:month]}/#{params[:date][:day]}/#{params[:date][:year]} \n\n" +
    			
    			"Reason for Appointment: #{params[:survey][:reason_for_appt] } \n\n" +
    			
    			"Caregiver seen: #{params[:survey][:caregiver_seen] } \n\n" +

    			"Message: #{params[:survey][:message]} \n\n"
    			
      return body
  end
  
end
