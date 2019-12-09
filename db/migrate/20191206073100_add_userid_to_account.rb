class AddUseridToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :userid, :string
  end
end
