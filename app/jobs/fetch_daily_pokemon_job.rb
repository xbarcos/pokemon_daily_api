class FetchDailyPokemonJob < ApplicationJob
  queue_as :default

  def perform
    today = Date.today
    return if Pokemon.exists?(date: today)

    max_pokemon = 898
    random_id = rand(1..max_pokemon)

    response = HTTParty.get("https://pokeapi.co/api/v2/pokemon/#{random_id}")
    return unless response.success?

    data = response.parsed_response
    name = data["name"]
    pokedex_number = data["id"]
    image_url = data.dig("sprites", "front_default")

    Pokemon.create!(
      name: name,
      pokedex_number: pokedex_number,
      image: image_url,
      date: today
    )
  end
end
