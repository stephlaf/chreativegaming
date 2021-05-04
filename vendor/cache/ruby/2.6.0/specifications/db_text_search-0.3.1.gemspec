# -*- encoding: utf-8 -*-
# stub: db_text_search 0.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "db_text_search".freeze
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gleb Mazovetskiy".freeze]
  s.date = "2019-08-17"
  s.description = "Different relational databases treat text search very differently. DbTextSearch provides a unified interface on top of ActiveRecord for SQLite, MySQL, and PostgreSQL to do case-insensitive string-in-set querying and CI index creation, and basic full-text search for a list of terms, and FTS index creation.".freeze
  s.email = ["glex.spb@gmail.com".freeze]
  s.homepage = "https://github.com/thredded/db_text_search".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new("~> 2.1".freeze)
  s.rubygems_version = "3.2.16".freeze
  s.summary = "A unified interface on top of ActiveRecord for SQLite, MySQL, and PostgreSQLfor case-insensitive string search and basic full-text search.".freeze

  s.installed_by_version = "3.2.16" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 4.1.15", "< 7.0"])
    s.add_development_dependency(%q<mysql2>.freeze, [">= 0.3.20"])
    s.add_development_dependency(%q<pg>.freeze, [">= 0.18.4"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 1.3.11"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 11.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 4.1.15", "< 7.0"])
    s.add_dependency(%q<mysql2>.freeze, [">= 0.3.20"])
    s.add_dependency(%q<pg>.freeze, [">= 0.18.4"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 1.3.11"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
