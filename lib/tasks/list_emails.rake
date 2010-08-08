task :list_emails, :needs => :environment do

  companies = Company.find(:all)

  for c in companies

    print c.email,","

  end
  
  print "\n"
  
end