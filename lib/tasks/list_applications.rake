task :list_applications, :needs => :environment do

  apps = Application.find(:all,:include => :company, :order => "companies.title,applications.title")

  for a in apps

    title = ''
    company = ''

    if a.title == nil
      title = 'UNKNOWN'
    else
      title = a.title
    end
    
    if a.company == nil
      company = 'COMPANY IS NIL!'
    elsif a.company.title == nil
      company = 'COMPANY TITLE IS NIL!'
    else
      company = a.company.title
    end

    print title,"\n"
    print company,"\n\n"

  end
  
end