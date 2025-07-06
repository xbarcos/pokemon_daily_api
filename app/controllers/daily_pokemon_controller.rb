class DailyPokemonController < ApplicationController
  def manual_refresh
    begin
      FetchDailyPokemonJob.perform_now
      render json: { message: "Pokémon diário atualizado com sucesso." }, status: :ok
    rescue => e
      render json: { error: "Erro ao atualizar Pokémon diário.", details: e.message }, status: :internal_server_error
    end
  end
  def index
    today = Date.today
    pokemon = Pokemon.find_by(date: today)

    if pokemon.nil?
      FetchDailyPokemonJob.perform_now
      pokemon = Pokemon.find_by(date: today)
    end

    if pokemon
      render json: {
        name: pokemon.name,
        pokedex_number: pokemon.pokedex_number,
        image: pokemon.image,
        date: pokemon.date
      }

    else
      render json: { error: "Nenhum Pokémon foi encontrado. Tente novamente mais tarde." }, status: :not_found
    end
  end
end
