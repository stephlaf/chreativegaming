# -*- encoding: utf-8 -*-
# stub: activerecord-postgres_enum 1.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "activerecord-postgres_enum".freeze
  s.version = "1.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michael Merkushin".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-12-11"
  s.email = ["merkushin.m.s@gmail.com".freeze]
  s.homepage = "https://github.com/bibendi/activerecord-postgres_enum".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.16".freeze
  s.summary = "Integrate PostgreSQL's enum data type into ActiveRecord's schema and migrations.".freeze

  s.installed_by_version = "3.2.16" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 5", "< 6.2"])
    s.add_runtime_dependency(%q<pg>.freeze, [">= 0"])
    s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.2"])
    s.add_development_dependency(%q<bundler>.freeze, [">= 1.16"])
    s.add_development_dependency(%q<combustion>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<pry-byebug>.freeze, ["~> 3"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<standard>.freeze, ["~> 0.10"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 5", "< 6.2"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 2.2"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.16"])
    s.add_dependency(%q<combustion>.freeze, ["~> 1.1"])
    s.add_dependency(%q<pry-byebug>.freeze, ["~> 3"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 4.0"])
    s.add_dependency(%q<standard>.freeze, ["~> 0.10"])
  end
end
