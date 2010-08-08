task :list_applications, :needs => :environment do

  apps = Application.find(:all)

  for a in apps
    
    if a.company.title != nil
      print a.title,"\t\t",a.company.title,"\n"
    else
      print a.title,"\t\tCOMPANY IS NIL!","\n"
    end

  end
  
end