class AddBasicToPayslip < ActiveRecord::Migration[6.0]
  def change
    add_column :payslips, :basic, :number
    add_column :payslips, :hra, :number
    add_column :payslips, :cca, :number
    add_column :payslips, :reim, :number
    add_column :payslips, :sa, :number
    add_column :payslips, :ta, :number
    add_column :payslips, :lop, :number
    add_column :payslips, :od, :number
    add_column :payslips, :month, :number
    add_column :payslips, :year, :number
  end
end
