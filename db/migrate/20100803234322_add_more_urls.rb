class AddMoreUrls < ActiveRecord::Migration
  def self.up
    add_column :companies, :url, :string
    add_column :applications, :moreinfo, :string
  end

  def self.down
    remove_column :companies, :url
    remove_column :applications, :moreinfo
  end
end
