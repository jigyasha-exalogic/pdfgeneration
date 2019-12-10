class Payslip < ApplicationRecord
  	validates :reim, :presence => true
  	validates :lop, :presence => true
  	validates :od, :presence => true
  	validates_uniqueness_of :payslipid
  	validates :gross, :presence => true
end
