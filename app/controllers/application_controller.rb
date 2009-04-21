# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :authenticate
  require 'rubygems'
  require 'pony'
  
  def authenticate
    authenticate_or_request_with_http_basic('Temporary Authentication') do |username, password|
    htpasswd = {'aacow' => 'aacow_tmp_pass'}
    htpasswd[username] == password
    end
  end
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
