class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :postal_code, :integer
    add_column :users, :prefecture_code, :integer
    add_column :users, :adress_city, :string
    add_column :users, :adress_street, :string
  end
end
