source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.6.3'
# ruby '2.6.6'
# ruby '2.7.3'
# ruby '2.7.4'
ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.6'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
# gem 'puma', '~> 4.1'
gem 'puma', '4.3.6'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Custom
gem 'simple_form'
gem 'dotenv-rails', groups: [:development, :test]
gem 'devise'
# gem 'cloudinary', '~> 1.12.0'
# gem 'cloudinary', '1.13.2'
gem 'cloudinary', '~> 1.25'
gem 'rinku'
gem 'postmark-rails'

gem 'autoprefixer-rails'
gem 'font-awesome-sass', '~> 5.6.1'

gem 'pundit'

gem 'money-rails', '~>1.12'
gem 'faker'

gem 'stripe'
gem 'stripe_event'

# To have PG worl well with enums
gem 'activerecord-postgres_enum'

# Administrate panel
gem "administrate"
gem 'administrate-field-active_storage'
gem "image_processing"
gem 'administrate-field-enum'

# Forum stuff
# gem 'thredded', '~> 0.16.16'
gem 'thredded', '~> 1.1'
gem 'rails-ujs'

gem "aws-sdk-s3", require: false

# Temp fix for the mimemagic problem
# gem 'mimemagic', '0.3.4', git: 'https://github.com/mimemagicrb/mimemagic', ref: '64b60d1'
# gem 'mimemagic', '0.3.5', git: 'https://github.com/mimemagicrb/mimemagic', ref: '01f92d8'
gem 'sprockets', '3.7.2'

# Background jobs
# gem 'sidekiq'
# gem 'sidekiq-failures', '~> 1.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
  gem 'bullet'
  gem 'letter_opener'
  gem 'rails-erd'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
