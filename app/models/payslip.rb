class Payslip < ApplicationRecord

  	validates :sa, :presence => true
  	validates :ta, :presence => true
  	validates :reim, :presence => true
  	validates :lop, :presence => true
  	validates :od, :presence => true
  	validates :payslipid, :presence => true, :uniqueness => true
end
