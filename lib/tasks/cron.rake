task :cron, :needs => :environment do
  
  companies = Company.find(:all)
  for c in companies
    c.display_order = rand(1000)
    c.save
  end
  
end