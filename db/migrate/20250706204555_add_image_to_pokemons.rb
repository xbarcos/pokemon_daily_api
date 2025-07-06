class AddImageToPokemons < ActiveRecord::Migration[8.0]
  def change
    add_column :pokemons, :image, :string
  end
end
