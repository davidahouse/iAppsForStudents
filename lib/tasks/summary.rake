task :summary, :needs => :environment do

  mac = 0
  iphone = 0
  ipad = 0

  apps = Application.find(:all)
  
  for a in apps
    
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
  
  end

  print 'Mac Apps: ',mac.to_s,"\n"
  print 'iPhone Apps: ',iphone.to_s,"\n"
  print 'iPad Apps: ',ipad.to_s,"\n"
  
end