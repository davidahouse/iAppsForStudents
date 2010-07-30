class Application < ActiveRecord::Base
  
  belongs_to :company
  validates_numericality_of :list_price
  validates_numericality_of :sale_price
  validates_numericality_of :discount
  
  has_attached_file :icon,
    :styles => { :small => "150x150>" },
    :storage => :s3,
    :bucket => ENV['S3_BUCKET'],
    :s3_credentials => 
        { :access_key_id => ENV['S3_ACCESSKEY'],
          :secret_access_key => ENV['S3_SECRETKEY'] },
    :path => ":attachment/:id/:style.:extension"
  
  
protected
def validate
  errors.add(:list_price, "List price should be at least 0.01") if list_price.nil? || list_price < 0.01
  errors.add(:sale_price, "Sale price should be at least 0.01") if sale_price.nil? || sale_price < 0.01
end
  
  
end
