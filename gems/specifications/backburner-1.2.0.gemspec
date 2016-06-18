# -*- encoding: utf-8 -*-
# stub: backburner 1.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "backburner".freeze
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nathan Esquenazi".freeze]
  s.date = "2015-11-02"
  s.description = "Beanstalk background job processing made easy".freeze
  s.email = ["nesquena@gmail.com".freeze]
  s.executables = ["backburner".freeze]
  s.files = ["bin/backburner".freeze]
  s.homepage = "http://github.com/nesquena/backburner".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Reliable beanstalk background job processing made easy for Ruby and Sinatra".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<beaneater>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<dante>.freeze, ["> 0.1.5"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, ["= 3.2.0"])
      s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    else
      s.add_dependency(%q<beaneater>.freeze, ["~> 1.0"])
      s.add_dependency(%q<dante>.freeze, ["> 0.1.5"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, ["= 3.2.0"])
      s.add_dependency(%q<mocha>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<beaneater>.freeze, ["~> 1.0"])
    s.add_dependency(%q<dante>.freeze, ["> 0.1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, ["= 3.2.0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
  end
end
