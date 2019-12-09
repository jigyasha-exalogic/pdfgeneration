class AddNoticeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :date_of_joining, :date
    add_column :users, :salary_per_annum, :decimal
    add_column :users, :salary_per_month, :decimal
    add_column :users, :phonenumber, :integer
    add_column :users, :address, :text
    add_column :users, :blood_type, :string
    add_column :users, :emergency_name, :string
    add_column :users, :emergency_number, :integer
    add_column :users, :primary_skill, :string
    add_column :users, :secondary_skill1, :string
    add_column :users, :secondary_skill2, :string
    add_column :users, :notice, :integer
  end
end
