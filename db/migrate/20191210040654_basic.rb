class Basic < ActiveRecord::Migration[6.0]
  def change
  	change_column :payslips, :basic, :integer, :default => 0
  	change_column :payslips, :sa, :integer, :default => 0
  	change_column :payslips, :ta, :integer, :default => 0
  	change_column :payslips, :reim, :integer, :default => 0
  	change_column :payslips, :hra, :integer, :default => 0
  	change_column :payslips, :cca, :integer, :default => 0
  	change_column :payslips, :lop, :integer, :default => 0
  	change_column :payslips, :od, :integer, :default => 0
  	change_column :payslips, :pt, :integer, :default => 0
    change_column :payslips, :month, :integer
    change_column :payslips, :year, :integer
  end
end
