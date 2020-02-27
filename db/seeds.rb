require 'faker'
require 'open-uri'

puts "Destroying all games..."

Game.destroy_all if Rails.env.development?

puts "Seeding games..."

10.times do
  file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
  g = Game.new(
    name: Faker::Games::HeroesOfTheStorm.unique.battleground,
    description: Faker::Games::LeagueOfLegends.quote,
    category: Faker::Games::LeagueOfLegends.summoner_spell,
    level: Faker::Games::LeagueOfLegends.rank,
    price_cents: rand(100..500),
    status: %w(standby downloadable).sample
    )
  g.thumbnail.attach(io: file, filename: 'rand.jpg', content_type: 'image/jpg')
  g.save!
end

puts "All done"
