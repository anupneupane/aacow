class PagesController < ApplicationController
  
  layout 'secondary'
  
  def index
  end
  
  def show

  end
  
  def send_contact_form
    Pony.mail :to => 'jhblacklock@gmail.com',
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
