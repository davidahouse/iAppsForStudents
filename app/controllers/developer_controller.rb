class DeveloperController < ApplicationController

  layout 'main'

  def generate_regcode(length=6)
    chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ23456789'
    code = ''
    length.times { |i| code << chars[rand(chars.length)] }
    code
  end
  
  def index
    if ( session[:company] != nil )
      redirect_to :action => 'list'
    end
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
      company.reg_code = generate_regcode(10)
      company.save
      Registration.deliver_signup_notification(company)
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
    
    if company_id != nil
      @applications = Application.find(:all,:conditions => ['company_id = ?',company_id])
      @company = Company.find(company_id)
    else
      redirect_to :action => 'index'
    end
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
    
    if app.list_price.include? "$"
      app.list_price = app.list_price.sub(/$/,'')
    end

    if app.sale_price.include? "$"
      app.sale_price = app.sale_price.sub(/$/,'')
    end
    
    if ( (app.list_price != nil ) && ( app.sale_price != nil ) )
      app.discount = ( (app.list_price - app.sale_price) / app.list_price ) * 100
    else
      app.discount = 0.0
    end
    if app.approved == nil
      app.approved = true
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
