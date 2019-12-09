class ChangePincodeToBeStringInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :pincode, :string
  end
end
