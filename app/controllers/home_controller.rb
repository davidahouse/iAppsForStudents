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
      last_company = nil
      @devcount = 0      
      @appcount = 0
      @totaldiscount = 0.0
      apps = Application.find(:all,:include => :company, :order => "companies.title,applications.title")
      for a in apps
        
        if a.company != nil
        
          if last_company != a.company
            @devcount = @devcount + 1
            last_company = a.company
          end
        
          if ( ( a.price_currency != nil ) && ( a.list_price != nil ) && (a.sale_price != nil) )
        
            if ( a.price_currency == 'USD' )
              @totaldiscount = @totaldiscount + (a.list_price - a.sale_price)
            elsif ( a.price_currency == 'EUR' )
              @totaldiscount = @totaldiscount + ((a.list_price - a.sale_price) * 1.2979)
            else
              @totaldiscount = @totaldiscount + ((a.list_price - a.sale_price) * 1.5583)
            end
          end
        
          @appcount = @appcount + 1
        end
      end
      
      @totaldiscount = @totaldiscount.to_i
      
    end
    
  end

end
