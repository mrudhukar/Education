class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_school

  before_filter :require_login

  protected

  def current_school_session
    return @current_school_session if defined?(@current_school_session)
    @current_school_session = SchoolSession.find
  end

  def current_school
    return @current_school if defined?(@current_school)
    @current_school = (current_school_session && current_school_session.record)
  end

  def require_login
    unless current_school_session
      session[:orginal_uri] = request.url
      redirect_to login_path
    end
  end
end
