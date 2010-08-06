task :list_applications, :needs => :environment do

  apps = Application.find(:all)

  for a in apps

    print a.title,": ",a.company.title,"\n"


  end
  
end