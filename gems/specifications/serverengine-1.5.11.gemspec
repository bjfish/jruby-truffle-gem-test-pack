# -*- encoding: utf-8 -*-
# stub: serverengine 1.5.11 ruby lib

Gem::Specification.new do |s|
  s.name = "serverengine".freeze
  s.version = "1.5.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sadayuki Furuhashi".freeze]
  s.date = "2015-09-28"
  s.description = "A framework to implement robust multiprocess servers like Unicorn".freeze
  s.email = ["frsyuki@gmail.com".freeze]
  s.homepage = "https://github.com/fluent/serverengine".freeze
  s.licenses = ["Apache 2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.6.4".freeze
  s.summary = "ServerEngine - multiprocess server framework".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sigdump>.freeze, ["~> 0.2.2"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.13.0"])
    else
      s.add_dependency(%q<sigdump>.freeze, ["~> 0.2.2"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.13.0"])
    end
  else
    s.add_dependency(%q<sigdump>.freeze, ["~> 0.2.2"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.13.0"])
  end
end
