# -*- encoding: utf-8 -*-
# stub: redis_orm 0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "redis_orm".freeze
  s.version = "0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dmitrii Samoilov".freeze]
  s.date = "2013-05-03"
  s.description = "ORM for Redis (advanced key-value storage) with ActiveRecord API".freeze
  s.email = "germaninthetown@gmail.com".freeze
  s.extra_rdoc_files = ["CHANGELOG".freeze, "LICENSE".freeze, "README.md".freeze, "TODO".freeze, "lib/rails/generators/redis_orm/model/model_generator.rb".freeze, "lib/rails/generators/redis_orm/model/templates/model.rb.erb".freeze, "lib/redis_orm.rb".freeze, "lib/redis_orm/active_model_behavior.rb".freeze, "lib/redis_orm/associations/belongs_to.rb".freeze, "lib/redis_orm/associations/has_many.rb".freeze, "lib/redis_orm/associations/has_many_helper.rb".freeze, "lib/redis_orm/associations/has_many_proxy.rb".freeze, "lib/redis_orm/associations/has_one.rb".freeze, "lib/redis_orm/redis_orm.rb".freeze, "lib/redis_orm/utils.rb".freeze]
  s.files = ["CHANGELOG".freeze, "LICENSE".freeze, "README.md".freeze, "TODO".freeze, "lib/rails/generators/redis_orm/model/model_generator.rb".freeze, "lib/rails/generators/redis_orm/model/templates/model.rb.erb".freeze, "lib/redis_orm.rb".freeze, "lib/redis_orm/active_model_behavior.rb".freeze, "lib/redis_orm/associations/belongs_to.rb".freeze, "lib/redis_orm/associations/has_many.rb".freeze, "lib/redis_orm/associations/has_many_helper.rb".freeze, "lib/redis_orm/associations/has_many_proxy.rb".freeze, "lib/redis_orm/associations/has_one.rb".freeze, "lib/redis_orm/redis_orm.rb".freeze, "lib/redis_orm/utils.rb".freeze]
  s.homepage = "https://github.com/german/redis_orm".freeze
  s.rdoc_options = ["--line-numbers".freeze, "--inline-source".freeze, "--title".freeze, "Redis_orm".freeze, "--main".freeze, "README.md".freeze]
  s.rubyforge_project = "redis_orm".freeze
  s.rubygems_version = "2.6.6".freeze
  s.summary = "ORM for Redis (advanced key-value storage) with ActiveRecord API".freeze

  s.installed_by_version = "2.6.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_runtime_dependency(%q<activemodel>.freeze, [">= 3.0.0"])
      s.add_runtime_dependency(%q<redis>.freeze, [">= 2.2.0"])
      s.add_runtime_dependency(%q<uuid>.freeze, [">= 2.3.2"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.5.0"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<activemodel>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<redis>.freeze, [">= 2.2.0"])
      s.add_dependency(%q<uuid>.freeze, [">= 2.3.2"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.5.0"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<activemodel>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<redis>.freeze, [">= 2.2.0"])
    s.add_dependency(%q<uuid>.freeze, [">= 2.3.2"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.5.0"])
  end
end
