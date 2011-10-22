class SchoolSessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new
#    @tab = TabConstants::LOGIN
    @school_session = SchoolSession.new
  end

  def create
    @school_session = SchoolSession.new(params[:school_session])
    if @school_session.save
      redirect_to session[:orginal_uri] || root_url
    else
      flash[:error] = "Login failed. Please try again"
      redirect_to login_path
    end
  end

  def destroy
    @school_session = SchoolSession.find
    @school_session.destroy
    redirect_to root_url
  end
end
