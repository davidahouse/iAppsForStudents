class DescriptionToText < ActiveRecord::Migration
  def self.up
    remove_column :applications, :description
    add_column :applications, :description, :text
  end

  def self.down
  end
end
