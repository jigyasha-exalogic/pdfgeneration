class AddPtToPayslip < ActiveRecord::Migration[6.0]
  def change
    add_column :payslips, :pt, :decimal
    add_column :payslips, :payslipid, :string
    add_column :payslips, :userid, :integer
    
  end
end
