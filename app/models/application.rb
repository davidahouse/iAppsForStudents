class Application < ActiveRecord::Base
  
  belongs_to :company
  
  has_attached_file :icon,
    :styles => { :small => "150x150>" },
    :storage => :s3,
    :bucket => ENV['S3_BUCKET'],
    :s3_credentials => 
        { :access_key_id => ENV['S3_ACCESSKEY'],
          :secret_access_key => ENV['S3_SECRETKEY'] },
    :path => ":attachment/:id/:style.:extension"
  
end
