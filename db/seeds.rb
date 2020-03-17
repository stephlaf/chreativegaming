require 'faker'
require 'resolv-replace'
require 'open-uri'

puts "Destroying all games..."

Game.destroy_all if Rails.env.development?

puts "Seeding games..."

urls = [
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476046/gamethumbnails/03_jjojqm.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476045/gamethumbnails/07_y4guib.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476045/gamethumbnails/08_bvghc3.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476045/gamethumbnails/09_fd6oxf.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476045/gamethumbnails/02_sgd2ug.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476045/gamethumbnails/05_hvssjz.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476044/gamethumbnails/06_yjncev.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476044/gamethumbnails/01_x1vwt7.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584476044/gamethumbnails/04_wbumta.jpg'

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

banner_urls = [
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036412/gamebannersedit/08edit_h6tqke.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036413/gamebannersedit/07edit_qt4jnh.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036412/gamebannersedit/03edit_phsuuj.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036412/gamebannersedit/09edit_gab8p9.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036412/gamebannersedit/05edit_f4sc1c.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036411/gamebannersedit/06edit_vqrb00.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036411/gamebannersedit/04edit_dtrfm9.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036411/gamebannersedit/01edit_sckarv.jpg',
  'https://res.cloudinary.com/chreative-gaming/image/upload/v1584036411/gamebannersedit/02edit_vdfel3.jpg'
]

i = 0
9.times do
  p "opening game_file"
  game_file = File.open('test.exe.zip')
  p "game_file opened"

  p "opening URL num #{i}"
  file = URI.open(urls[i])
  p "URL num #{i} opened"

  p "opening Banner URL num #{i}"
  banner_file = URI.open(banner_urls[i])
  p "Banner URL num #{i} opened"

  g = Game.new(
    name: Faker::Games::HeroesOfTheStorm.unique.battleground,
    description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
    category: Faker::Games::LeagueOfLegends.summoner_spell,
    price_cents: rand(100..500),
    # status: %w(standby downloadable).sample
    available: [true, false].sample
    )
  g.thumbnail.attach(io: file, filename: 'rand.jpg', content_type: 'image/jpg')
  g.banner.attach(io: banner_file, filename: 'rand.jpg', content_type: 'image/jpg')
  g.game_file.attach(io: game_file, filename: 'game_file', content_type:'application/raw', identify: false)
  p "Saving game #{i}"
  g.save!
  i += 1
end

puts "All done"
