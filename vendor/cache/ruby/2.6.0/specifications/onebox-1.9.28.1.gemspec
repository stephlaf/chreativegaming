# -*- encoding: utf-8 -*-
# stub: onebox 1.9.28.1 ruby lib

Gem::Specification.new do |s|
  s.name = "onebox".freeze
  s.version = "1.9.28.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Joanna Zeta".freeze, "Vyki Englert".freeze, "Robin Ward".freeze]
  s.date = "2020-05-06"
  s.description = "A gem for generating embeddable HTML previews from URLs.".freeze
  s.email = ["holla@jzeta.com".freeze, "vyki.englert@gmail.com".freeze, "robin.ward@gmail.com".freeze]
  s.homepage = "https://github.com/discourse/onebox".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.2.16".freeze
  s.summary = "A gem for generating embeddable HTML previews from URLs.".freeze

  s.installed_by_version = "3.2.16" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.7.0"])
    s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.11"])
    s.add_runtime_dependency(%q<mustache>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<nokogiri>.freeze, ["~> 1.7"])
    s.add_runtime_dependency(%q<htmlentities>.freeze, ["~> 4.3"])
    s.add_runtime_dependency(%q<sanitize>.freeze, [">= 0"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_development_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
    s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
    s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.78.0"])
    s.add_development_dependency(%q<rubocop-discourse>.freeze, ["~> 1.0.1"])
    s.add_development_dependency(%q<twitter>.freeze, ["~> 4.8"])
    s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.2.8"])
    s.add_development_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<sinatra-contrib>.freeze, ["~> 1.4"])
    s.add_development_dependency(%q<haml>.freeze, ["~> 5.1"])
    s.add_development_dependency(%q<listen>.freeze, ["~> 2.10.0"])
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.7.0"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.11"])
    s.add_dependency(%q<mustache>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, ["~> 1.7"])
    s.add_dependency(%q<htmlentities>.freeze, ["~> 4.3"])
    s.add_dependency(%q<sanitize>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, [">= 12.3.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.2"])
    s.add_dependency(%q<fakeweb>.freeze, ["~> 1.3"])
    s.add_dependency(%q<pry>.freeze, ["~> 0.10"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.78.0"])
    s.add_dependency(%q<rubocop-discourse>.freeze, ["~> 1.0.1"])
    s.add_dependency(%q<twitter>.freeze, ["~> 4.8"])
    s.add_dependency(%q<guard-rspec>.freeze, ["~> 4.2.8"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_dependency(%q<sinatra-contrib>.freeze, ["~> 1.4"])
    s.add_dependency(%q<haml>.freeze, ["~> 5.1"])
    s.add_dependency(%q<listen>.freeze, ["~> 2.10.0"])
  end
end
