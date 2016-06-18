# -*- encoding: utf-8 -*-
# stub: jdbc-mysql 5.1.38 ruby lib

Gem::Specification.new do |s|
  s.name = "jdbc-mysql".freeze
  s.version = "5.1.38"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sieger, Ola Bini, Karol Bucek and JRuby contributors".freeze]
  s.date = "2016-02-05"
  s.description = "Install this gem `require 'jdbc/mysql'` and invoke `Jdbc::MySQL.load_driver` within JRuby to load the driver.".freeze
  s.email = ["nick@nicksieger.com".freeze, "ola.bini@gmail.com".freeze, "self@kares.org".freeze]
  s.homepage = "http://github.com/jruby/activerecord-jdbc-adapter/tree/master/jdbc-mysql".freeze
  s.licenses = ["GPL-2".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "JDBC driver for JRuby and MySQL (used by ActiveRecord-JDBC).".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version
end
