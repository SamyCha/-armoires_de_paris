class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
        add_column :products, :taille, :string
        add_column :products, :category, :string
        add_column :products, :price, :decimal
        add_column :products, :sexe, :string
        add_column :products, :marque, :string
        add_column :products, :etat, :string
        add_column :products, :matiere, :string
        add_column :products, :couleur, :string

  end
end
