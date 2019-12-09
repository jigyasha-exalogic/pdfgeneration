class CreateSals < ActiveRecord::Migration[6.0]
  def change
    create_table :sals do |t|

      t.timestamps
    end
  end
end
