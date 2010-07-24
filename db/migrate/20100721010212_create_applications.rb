class CreateApplications < ActiveRecord::Migration
  def self.up
    create_table :applications do |t|
      t.string :title
      t.integer :company_id
      t.string :description
      t.string :image_file
      t.string :url
      t.string :discount_code
      t.string :platform
      t.boolean :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :applications
  end
end
