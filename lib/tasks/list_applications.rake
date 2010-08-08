task :list_applications, :needs => :environment do

  apps = Application.find(:all)

  for a in apps
    
    if a.title == nil
      print "UNKNOWN\t\t",a.id.to_s,"\n"
    elsif a.company == nil
      print a.title,"\t\tCOMPANY IS NIL!","\n"
    elsif a.company.title == nil
      print a.title,"\t\tCOMPANY TITLE IS NIL!","\n"
    else
      print a.title,"\t\t",a.company.title,"\n"
    end

  end
  
end