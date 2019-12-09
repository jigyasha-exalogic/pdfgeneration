class ChangePhonenumberToBeStringInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :phonenumber, :string
    change_column :users, :emergency_number, :string

  end
end
