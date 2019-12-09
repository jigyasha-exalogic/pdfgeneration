class AddEmpidToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :empid, :string, :default => "0000"
  end
end
