class AddIconFields < ActiveRecord::Migration
  def self.up
    add_column :applications, :icon_file_name, :string
    add_column :applications, :icon_content_type, :string
    add_column :applications, :icon_file_size, :integer
  end

  def self.down
    remove_column :applications, :icon_file_name
    remove_column :applications, :icon_content_type
    remove_column :applications, :icon_file_size
  end
end
