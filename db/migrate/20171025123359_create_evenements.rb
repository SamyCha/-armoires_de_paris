class CreateEvenements < ActiveRecord::Migration[5.1]
  def change
    create_table :evenements do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
