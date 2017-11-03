class AddZipcodeToEvenements < ActiveRecord::Migration[5.1]
  def change
    add_column :evenements, :zipcode, :string
  end
end
