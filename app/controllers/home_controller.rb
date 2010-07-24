class HomeController < ApplicationController
  
  layout 'main'

  def index
    
    @platform = params[:platform]
    
    # gather up all the applications sorted by company first, then application second
    if ( params[:platform] == 'mac' )
      @applications = Application.find(:all,:conditions => ['platform = "M"'])
    elsif ( params[:platform] == 'iphone' )
      @applications = Application.find(:all,:conditions => ['platform = "P" or platform = "U"'])
    elsif (params[:platform] == 'ipad')
      @applications = Application.find(:all,:conditions => ['platform = "D" or platform = "U"'])  
    end
  end

end
