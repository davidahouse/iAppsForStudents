task :list_companies, :needs => :environment do

  companies = Company.find(:all)

  for c in companies

    print c.title,": ",c.contact,"\n"

  end
  
end