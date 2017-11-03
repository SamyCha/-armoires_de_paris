class AddDateToEvenements < ActiveRecord::Migration[5.1]
  def change
    add_column :evenements, :date, :string
  end
end
