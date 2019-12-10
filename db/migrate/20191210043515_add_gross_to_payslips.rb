class AddGrossToPayslips < ActiveRecord::Migration[6.0]
  def change
    add_column :payslips, :gross, :numeric
    add_column :payslips, :net, :numeric
    add_column :payslips, :ctc, :numeric
  end
end
