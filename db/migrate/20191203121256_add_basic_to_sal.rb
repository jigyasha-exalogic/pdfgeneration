class AddBasicToSal < ActiveRecord::Migration[6.0]
  def change
    add_column :sals, :basic, :decimal, :default => 0
    add_column :sals, :hra, :decimal, :default => 0
    add_column :sals, :cca, :decimal, :default => 0
    add_column :sals, :sa, :decimal, :default => 0
    add_column :sals, :ta, :decimal, :default => 0
    add_column :sals, :reim, :decimal, :default => 0
    add_column :sals, :it, :decimal, :default => 0
    add_column :sals, :pt, :decimal, :default => 0
    add_column :sals, :lop, :decimal, :default => 0
    add_column :sals, :od, :decimal, :default => 0
  end
end
