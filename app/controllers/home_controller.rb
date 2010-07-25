class HomeController < ApplicationController
  
  layout 'main'

  def index
    
    @platform = params[:platform]
    
    # gather up all the applications sorted by company first, then application second
    if ( params[:platform] == 'mac' )
      @applications = Application.find(:all,:include => :company, :order => "companies.title,applications.title", 
                    :conditions => ['platform = "M"'])
    elsif ( params[:platform] == 'iphone' )
      @applications = Application.find(:all,:include => :company, :order => "companies.title,applications.title",
                    :conditions => ['platform = "P" or platform = "U"'])
    elsif (params[:platform] == 'ipad')
      @applications = Application.find(:all,:include => :company, :order => "companies.title,applications.title",
                    :conditions => ['platform = "D" or platform = "U"'])  
    end
  end

end
