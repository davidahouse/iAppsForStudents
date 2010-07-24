class DeveloperController < ApplicationController

  layout 'main'

  def index

  end
  
  def login
    
    company = Company.find(:first, :conditions => ['email = ? and reg_code = ?',params[:email],params[:reg_code]])
    if company == nil
      redirect_to :action => 'login_fail'
    else
      session[:company] = company.id
      redirect_to :action => 'list'
    end
  end
  
  def login_fail
    
  end
  
  def register
    @company = Company.new
  end
  
  def saveregister
    if ( params[:id] == nil )
      company = Company.new(params[:company])
      company.save
      redirect_to :action => 'index'
    else
      company = Company.find(params[:id])
      company.update_attributes(:company)
      company.save
    end
  end
  
  def newregister
    
  end
  
  def list
    company_id = session[:company]
    @applications = Application.find(:all,:conditions => ['company_id = ?',company_id])
  end

  def editapp
    if ( params[:appid] == nil )
      @application = Application.new
    else
      @application = Application.find(params[:appid])
    end
  end
  
  def saveapp
    if ( params[:id] == nil )
      app = Application.new(params[:application])
      app.company_id = session[:company]
    else
      app = Application.find(params[:id])
      app.update_attributes(params[:application])
    end
    app.save
    redirect_to :action => 'list'
  end
  
  def deleteapp
    app = Application.find(params[:appid])
    app.delete
    redirect_to :action => 'list'
  end
  
end
