class ApplicationController < ActionController::Base

  helper :all
  protect_from_forgery  #:secret => '5f44228feb8fa9a834102a8bc41bcd73'
  
  require 'action_controller/mime_type' 
  Mime::Type.register "text/xml", :tbx
  
  filter_parameter_logging :password

  helper_method :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
