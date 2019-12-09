class AddUseridToSal < ActiveRecord::Migration[6.0]
  def change
    add_column :sals, :userid, :string
  end
end
