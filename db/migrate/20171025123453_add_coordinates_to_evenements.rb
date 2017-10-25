class AddCoordinatesToEvenements < ActiveRecord::Migration[5.1]
  def change
    add_column :evenements, :latitude, :float
    add_column :evenements, :longitude, :float
  end
end
