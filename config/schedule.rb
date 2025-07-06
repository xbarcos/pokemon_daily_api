every 1.day, at: "00:00 am" do
  runner "FetchDailyPokemonJob.perform_now"
end
