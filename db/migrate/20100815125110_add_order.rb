class AddOrder < ActiveRecord::Migration
  def self.up
    add_column :companies, :display_order, :integer
  end

  def self.down
    remove_column :companies, :display_order
  end
end
