require 'faker'
require 'resolv-replace'
require 'open-uri'

puts "Destroying all games..."

# Game.destroy_all if Rails.env.development?

puts "Seeding games..."

urls = [
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922799/65qqreerqxtw478fa7oxjbxpq310.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922799/ni4u2e55545krh0znhii19n45iqm.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922798/0axikj8uumujc5tgouvmoosk8tha.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922798/0khjvs9k5hx9dsdgco178e25k6x4.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922797/zyjlnzltr6hnwdbef6nqu58e037z.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922797/9usn2iq2vt9dftaziyc6d1s7yypq.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922796/pfoetdch3uuodoco3n2kiqh1kocv.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922796/ja11ijo6xyq6f0kgap4gqdqebeen.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922800/eil7sn3qzxtsxpkxlotrfw1t1fv6.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1582922795/r3r3m4hgy31x3tbfo70or9qfhas1.jpg'

  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Assassins-Creed-wallpaper-iphone.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Battlefield-Aircraft-wallpaper-iphone.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Crysis_3_game_wallpaper.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Devil-May-Cry-game-3.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Devil-May-Cry-game-wallpaper.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Diablo-lineage-wallpaper.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Fantasy-game-Diablo-wallpaper.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Online-games-DNF.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Ninja-Gaiden-hd-wallpaper.jpg',
  # 'https://www.designzzz.com/wp-content/uploads/2013/04/Angry-bird-wallpaper-iphone.jpg'
]

  p "opening game_file"
  # game_file = URI.open('https://res.cloudinary.com/chreative-gaming/raw/upload/v1583255749/dr1vxvknpno9hc7kcifx.zip')
  # game_file = File.open('Ninja-Gaiden-hd-wallpaper.jpg')
  game_file = File.open('test.exe.zip')
  p "game_file opened"

i = 0
1.times do
  p "opening URL num #{i}"
  file = URI.open(urls[i])
  p "URL num #{i} opened"
  g = Game.new(
    name: Faker::Games::HeroesOfTheStorm.unique.battleground,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    category: Faker::Games::LeagueOfLegends.summoner_spell,
    level: Faker::Games::LeagueOfLegends.rank,
    price_cents: rand(100..500),
    # status: %w(standby downloadable).sample
    available: [true, false].sample
    )
  g.thumbnail.attach(io: file, filename: 'rand.jpg', content_type: 'image/jpg')
  g.game_file.attach(io: game_file, filename: 'game_file')
  # g.game_file.attach(io: game_file, filename: 'game_file', content_type:'application/raw', identify: false)
  g.save!
  i += 1
end

puts "All done"
