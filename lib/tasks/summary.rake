task :summary, :needs => :environment do

  mac = 0
  iphone = 0
  ipad = 0

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
    
      if a.platform == 'M'
        mac = mac + 1
      elsif a.platform == 'P'
        iphone = iphone + 1
      elsif a.platform == 'D'
        ipad = ipad + 1
      elsif a.platform == 'U'
        iphone = iphone + 1
        ipad = ipad + 1
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

  print 'Mac Apps: ',mac.to_s,"\n"
  print 'iPhone Apps: ',iphone.to_s,"\n"
  print 'iPad Apps: ',ipad.to_s,"\n"
  print 'Companies: ',@devcount.to_s,"\n"
  print 'Total Discount: ',@totaldiscount.to_s,"\n"
end