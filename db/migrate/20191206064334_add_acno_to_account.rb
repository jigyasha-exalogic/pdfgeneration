class AddAcnoToAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :accounts, :acno, :string
    add_column :accounts, :acname, :string
    add_column :accounts, :bankname, :string
    add_column :accounts, :ifsc, :string
    add_column :accounts, :branch, :string
  end
end
