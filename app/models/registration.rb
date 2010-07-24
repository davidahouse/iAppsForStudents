class Registration < ActionMailer::Base
  
  def signup_notification(company)
    recipients "#{company.contact} <#{company.email}>"
    from "support@iappsforstudents.com"
    subject "New account registration"
    sent_on Time.now
    body :company => company
  end
end
