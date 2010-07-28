class HomeController < ApplicationController
  
  layout 'main'

  def index
    
    @platform = params[:platform]
    if ((@platform == nil) || (@platform == ''))
      @platform = 'mac'
    end
    
    # gather up all the applications sorted by company first, then application second
    if ( @platform == 'mac' )
      @applications = Application.find(:all,:include => :company, :order => "companies.title,applications.title", 
                    :conditions => ['platform = "M"'])
    elsif ( @platform == 'iphone' )
      @applications = Application.find(:all,:include => :company, :order => "companies.title,applications.title",
                    :conditions => ['platform = "P" or platform = "U"'])
    elsif (@platform == 'ipad')
      @applications = Application.find(:all,:include => :company, :order => "companies.title,applications.title",
                    :conditions => ['platform = "D" or platform = "U"'])  
    end
    
  end

end
