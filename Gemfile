source "https://rubygems.org"

gem "rails", "~> 8.0.2"
gem "pg", ">= 1.1"
gem "puma", ">= 5.0"
gem "httparty"

# Reduz boot time
gem "bootsnap", require: false

# Para rodar em Windows
gem "tzinfo-data", platforms: %i[windows jruby]

group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end
