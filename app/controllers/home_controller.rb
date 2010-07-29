class HomeController < ApplicationController
  
  layout 'main'

  def index
    
    @platform = params[:platform]
    if ((@platform == nil) || (@platform == ''))
      @platform = 'mac'
    end
    
    if ENV['saleActive'] == 'YES'
      
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
    
    else
      @devcount = Company.count
      
      @appcount = 0
      @totaldiscount = 0.0
      apps = Application.find(:all)
      for a in apps
        
        if ( ( a.price_currency != nil ) && ( a.discount != nil ) )
        
          if ( a.price_currency == 'USD' )
            @totaldiscount = @totaldiscount + a.discount
          elsif ( a.price_currency == 'EUR' )
            @totaldiscount = @totaldiscount + (a.discount * 1.2979)
          else
            @totaldiscount = @totaldiscount + (a.discount * 1.5583)
          end
        end
        
        @appcount = @appcount + 1
      end
      
      @totaldiscount = @totaldiscount.to_i
      
    end
    
  end

end
