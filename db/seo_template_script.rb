

seo = SeoTemplate.new
file = URI.open('https://m.media-amazon.com/images/M/MV5BYmU5OWM5ZTAtNjUzOC00NmUyLTgyOWMtMjlkNjdlMDAzMzU1XkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg')
# file = File.open('app/images/platformMeteorImage.jpeg')
seo.home_page_picture.attach(io: file, filename: "homepic.png", content_type: "image/jpeg")
seo.save!
