class ForeignKeyIndex < ActiveRecord::Migration
  def self.up
    add_index :applications, :company_id
    add_index :companies, :display_order
  end

  def self.down
    remove_index :applications, :company_id
    remove_index :companies, :display_order
  end
end
