class CreatePokemons < ActiveRecord::Migration[8.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :pokedex_number
      t.date :date

      t.timestamps
    end
    add_index :pokemons, :date, unique: true
  end
end
