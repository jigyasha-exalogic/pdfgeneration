class ChangeBasic < ActiveRecord::Migration[6.0]
  def change
  	add_column :payslips, :basic, :integer, :default => 0
  	add_column :payslips, :sa, :integer, :default => 0
  	add_column :payslips, :ta, :integer, :default => 0
  	add_column :payslips, :reim, :integer, :default => 0
  	add_column :payslips, :hra, :integer, :default => 0
  	add_column :payslips, :cca, :integer, :default => 0
  	add_column :payslips, :lop, :integer, :default => 0
  	add_column :payslips, :od, :integer, :default => 0
  	add_column :payslips, :pt, :integer, :default => 0
    add_column :payslips, :month, :integer
    add_column :payslips, :year, :integer
  end
end
