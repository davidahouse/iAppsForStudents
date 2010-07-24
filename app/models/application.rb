class Application < ActiveRecord::Base
  
  has_attached_file :icon,
    :styles => { :small => "150x150>" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension"
  
end
