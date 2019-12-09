class ChangeLopToBeIntegerInSal < ActiveRecord::Migration[6.0]
  def change
  	change_column :sals, :lop, :integer, :default => 0
  end
end
