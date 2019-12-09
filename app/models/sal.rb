class Sal < ApplicationRecord
	validates :basic, :presence => true
  	validates :hra, :presence => true
  	validates :cca, :presence => true
  	validates :sa, :presence => true
  	validates :ta, :presence => true
  	validates :reim, :presence => true
  	validates :lop, :presence => true
  	validates :od, :presence => true
  	 validates :id, :presence => true, :uniqueness => true
end
