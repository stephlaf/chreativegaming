# -*- encoding: utf-8 -*-
# stub: thredded 0.16.16 ruby lib

Gem::Specification.new do |s|
  s.name = "thredded".freeze
  s.version = "0.16.16"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joel Oliveira".freeze, "Gleb Mazovetskiy".freeze]
  s.date = "2020-02-13"
  s.description = "The best Rails 4.2+ forums engine ever. Its goal is to be as simple and feature rich as possible.\nThredded works with SQLite, MySQL (v5.6.4+), and PostgreSQL. See the demo at https://thredded.org/.".freeze
  s.email = ["joel@thredded.com".freeze, "glex.spb@gmail.com".freeze]
  s.homepage = "https://thredded.org".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.3".freeze)
  s.rubygems_version = "3.2.16".freeze
  s.summary = "The best Rails forums engine ever.".freeze

  s.installed_by_version = "3.2.16" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<active_record_union>.freeze, [">= 1.3.0"])
    s.add_runtime_dependency(%q<db_text_search>.freeze, ["~> 0.3.0"])
    s.add_runtime_dependency(%q<friendly_id>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<htmlentities>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<inline_svg>.freeze, [">= 1.6.0"])
    s.add_runtime_dependency(%q<kaminari>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<pundit>.freeze, [">= 1.1.0"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 4.2.10", "!= 6.0.0.rc2"])
    s.add_runtime_dependency(%q<rb-gravatar>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<html-pipeline>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<kramdown>.freeze, [">= 2.0.0"])
    s.add_runtime_dependency(%q<kramdown-parser-gfm>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<onebox>.freeze, ["~> 1.8", ">= 1.8.99"])
    s.add_runtime_dependency(%q<rinku>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sanitize>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<sassc-rails>.freeze, [">= 2.0.0"])
    s.add_runtime_dependency(%q<sprockets-es6>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<timeago_js>.freeze, [">= 3.0.2.2"])
    s.add_development_dependency(%q<capybara>.freeze, ["~> 2.4"])
    s.add_development_dependency(%q<cuprite>.freeze, [">= 0.5"])
    s.add_development_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_development_dependency(%q<factory_bot>.freeze, [">= 5.0.2"])
    s.add_development_dependency(%q<faker>.freeze, [">= 1.9.3"])
    s.add_development_dependency(%q<launchy>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, [">= 3.5.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_development_dependency(%q<http_accept_language>.freeze, [">= 0"])
    s.add_development_dependency(%q<kaminari-i18n>.freeze, [">= 0"])
    s.add_development_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_development_dependency(%q<pg>.freeze, [">= 0"])
    s.add_development_dependency(%q<puma>.freeze, [">= 0"])
    s.add_development_dependency(%q<rails-i18n>.freeze, [">= 0"])
    s.add_development_dependency(%q<rails_email_preview>.freeze, [">= 2.2.1"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_development_dependency(%q<twemoji>.freeze, [">= 0"])
    s.add_development_dependency(%q<web-console>.freeze, [">= 0"])
    s.add_development_dependency(%q<thredded-markdown_coderay>.freeze, [">= 0"])
    s.add_development_dependency(%q<thredded-markdown_katex>.freeze, [">= 0"])
    s.add_development_dependency(%q<turbolinks>.freeze, [">= 0"])
  else
    s.add_dependency(%q<active_record_union>.freeze, [">= 1.3.0"])
    s.add_dependency(%q<db_text_search>.freeze, ["~> 0.3.0"])
    s.add_dependency(%q<friendly_id>.freeze, [">= 0"])
    s.add_dependency(%q<htmlentities>.freeze, [">= 0"])
    s.add_dependency(%q<inline_svg>.freeze, [">= 1.6.0"])
    s.add_dependency(%q<kaminari>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<pundit>.freeze, [">= 1.1.0"])
    s.add_dependency(%q<rails>.freeze, [">= 4.2.10", "!= 6.0.0.rc2"])
    s.add_dependency(%q<rb-gravatar>.freeze, [">= 0"])
    s.add_dependency(%q<html-pipeline>.freeze, [">= 0"])
    s.add_dependency(%q<kramdown>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<kramdown-parser-gfm>.freeze, [">= 0"])
    s.add_dependency(%q<onebox>.freeze, ["~> 1.8", ">= 1.8.99"])
    s.add_dependency(%q<rinku>.freeze, [">= 0"])
    s.add_dependency(%q<sanitize>.freeze, [">= 0"])
    s.add_dependency(%q<autoprefixer-rails>.freeze, [">= 0"])
    s.add_dependency(%q<sassc-rails>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<sprockets-es6>.freeze, [">= 0"])
    s.add_dependency(%q<timeago_js>.freeze, [">= 3.0.2.2"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.4"])
    s.add_dependency(%q<cuprite>.freeze, [">= 0.5"])
    s.add_dependency(%q<database_cleaner>.freeze, [">= 0"])
    s.add_dependency(%q<factory_bot>.freeze, [">= 5.0.2"])
    s.add_dependency(%q<faker>.freeze, [">= 1.9.3"])
    s.add_dependency(%q<launchy>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 3.5.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, [">= 0"])
    s.add_dependency(%q<http_accept_language>.freeze, [">= 0"])
    s.add_dependency(%q<kaminari-i18n>.freeze, [">= 0"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<puma>.freeze, [">= 0"])
    s.add_dependency(%q<rails-i18n>.freeze, [">= 0"])
    s.add_dependency(%q<rails_email_preview>.freeze, [">= 2.2.1"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<twemoji>.freeze, [">= 0"])
    s.add_dependency(%q<web-console>.freeze, [">= 0"])
    s.add_dependency(%q<thredded-markdown_coderay>.freeze, [">= 0"])
    s.add_dependency(%q<thredded-markdown_katex>.freeze, [">= 0"])
    s.add_dependency(%q<turbolinks>.freeze, [">= 0"])
  end
end
