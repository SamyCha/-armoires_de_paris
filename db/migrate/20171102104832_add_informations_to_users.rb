class AddInformationsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :avatar, :text
    add_column :users, :username, :string
  end
end
