# -*- encoding: utf-8 -*-
# stub: sneakers 0.1.1.pre ruby lib

Gem::Specification.new do |s|
  s.name = "sneakers".freeze
  s.version = "0.1.1.pre"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dotan Nahum".freeze]
  s.date = "2014-03-12"
  s.description = "Fast background processing framework for Ruby and RabbitMQ".freeze
  s.email = ["jondotan@gmail.com".freeze]
  s.executables = ["sneakers".freeze]
  s.files = ["bin/sneakers".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Fast background processing framework for Ruby and RabbitMQ".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<serverengine>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<bunny>.freeze, ["~> 1.1.3"])
      s.add_runtime_dependency(%q<thread>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
      s.add_development_dependency(%q<rr>.freeze, [">= 0"])
      s.add_development_dependency(%q<ruby-prof>.freeze, [">= 0"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_development_dependency(%q<guard-minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<metric_fu>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov-rcov-text>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<serverengine>.freeze, [">= 0"])
      s.add_dependency(%q<bunny>.freeze, ["~> 1.1.3"])
      s.add_dependency(%q<thread>.freeze, [">= 0"])
      s.add_dependency(%q<thor>.freeze, [">= 0"])
      s.add_dependency(%q<rr>.freeze, [">= 0"])
      s.add_dependency(%q<ruby-prof>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<guard-minitest>.freeze, [">= 0"])
      s.add_dependency(%q<metric_fu>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov-rcov-text>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<serverengine>.freeze, [">= 0"])
    s.add_dependency(%q<bunny>.freeze, ["~> 1.1.3"])
    s.add_dependency(%q<thread>.freeze, [">= 0"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<rr>.freeze, [">= 0"])
    s.add_dependency(%q<ruby-prof>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<guard-minitest>.freeze, [">= 0"])
    s.add_dependency(%q<metric_fu>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov-rcov-text>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
