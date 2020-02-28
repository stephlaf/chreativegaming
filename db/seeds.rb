require 'faker'
require 'open-uri'

puts "Destroying all games..."

Game.destroy_all if Rails.env.development?

puts "Seeding games..."

urls = [
  'https://www.designzzz.com/wp-content/uploads/2013/04/Angry-bird-wallpaper-iphone.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Assassins-Creed-wallpaper-iphone.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Battlefield-Aircraft-wallpaper-iphone.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Crysis_3_game_wallpaper.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Devil-May-Cry-game-3.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Devil-May-Cry-game-wallpaper.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Diablo-lineage-wallpaper.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Fantasy-game-Diablo-wallpaper.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Online-games-DNF.jpg',
  'https://www.designzzz.com/wp-content/uploads/2013/04/Ninja-Gaiden-hd-wallpaper.jpg'
]

i = 0
10.times do
  file = URI.open(urls[i])
  g = Game.new(
    name: Faker::Games::HeroesOfTheStorm.unique.battleground,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    category: Faker::Games::LeagueOfLegends.summoner_spell,
    level: Faker::Games::LeagueOfLegends.rank,
    price_cents: rand(100..500),
    status: %w(standby downloadable).sample
    )
  g.thumbnail.attach(io: file, filename: 'rand.jpg', content_type: 'image/jpg')
  g.save!
  i += 1
end

puts "All done"
