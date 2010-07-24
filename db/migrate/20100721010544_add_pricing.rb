class AddPricing < ActiveRecord::Migration
  def self.up
    add_column :applications, :list_price, :decimal, :precision => 8, :scale => 2
    add_column :applications, :sale_price, :decimal, :precision => 8, :scale => 2
    add_column :applications, :price_currency, :string
    add_column :applications, :discount, :decimal, :precision => 8, :scale => 2
  end

  def self.down
  end
end
