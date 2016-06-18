# -*- encoding: utf-8 -*-
# stub: kindlerb 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "kindlerb".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Daniel Choi".freeze]
  s.date = "2012-12-01"
  s.description = "Kindle eperiodical generator".freeze
  s.email = ["dhchoi@gmail.com".freeze]
  s.executables = ["kindlerb".freeze]
  s.files = ["bin/kindlerb".freeze]
  s.homepage = "http://github.com/danchoi/kindlerb".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.0".freeze)
  s.rubyforge_project = "kindlerb".freeze
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Kindle eperiodical generator".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mustache>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<mustache>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<mustache>.freeze, [">= 0"])
  end
end
