require "test_helper"

class DailyPokemonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_pokemon_index_url
    assert_response :success
  end
end
