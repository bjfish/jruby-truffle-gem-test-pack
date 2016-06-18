# -*- encoding: utf-8 -*-
# stub: w3c_validators 1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "w3c_validators".freeze
  s.version = "1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex Dunae".freeze]
  s.date = "2011-09-02"
  s.description = "W3C Validators is a Ruby wrapper for the World Wide Web Consortium's online validation services.".freeze
  s.email = "code@dunae.ca".freeze
  s.extra_rdoc_files = ["README.rdoc".freeze, "CHANGELOG".freeze, "LICENSE".freeze]
  s.files = ["CHANGELOG".freeze, "LICENSE".freeze, "README.rdoc".freeze]
  s.homepage = "http://code.dunae.ca/w3c_validators".freeze
  s.rdoc_options = ["--all".freeze, "--inline-source".freeze, "--line-numbers".freeze, "--charset".freeze, "utf-8".freeze]
  s.rubygems_version = "2.6.4".freeze
  s.summary = "Wrapper for the World Wide Web Consortium's online validation services.".freeze

  s.installed_by_version = "2.6.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
  end
end
