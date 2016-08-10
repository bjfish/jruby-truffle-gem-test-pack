# -*- encoding: utf-8 -*-
# stub: argon2 1.1.0 ruby lib
# stub: ext/argon2_wrap/extconf.rb

Gem::Specification.new do |s|
  s.name = "argon2".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Technion".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-08-09"
  s.description = "Argon2 FFI binding".freeze
  s.email = ["technion@lolware.net".freeze]
  s.extensions = ["ext/argon2_wrap/extconf.rb".freeze]
  s.files = [".gitignore".freeze, ".gitmodules".freeze, ".jruby-cext-build.yml".freeze, ".rubocop.yml".freeze, ".travis.yml".freeze, "CONTRIBUTING.md".freeze, "Changelog.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "argon2.gemspec".freeze, "bin/console".freeze, "bin/setup".freeze, "bin/setup-jruby+truffle".freeze, "bin/test-jruby+truffle".freeze, "bin/travis-setup".freeze, "ext".freeze, "ext/argon2_wrap".freeze, "ext/argon2_wrap/Makefile".freeze, "ext/argon2_wrap/argon_cext.c".freeze, "ext/argon2_wrap/argon_wrap.c".freeze, "ext/argon2_wrap/extconf.rb".freeze, "ext/argon2_wrap/test.c".freeze, "ext/phc-winner-argon2".freeze, "ext/phc-winner-argon2/.git".freeze, "ext/phc-winner-argon2/.gitattributes".freeze, "ext/phc-winner-argon2/.gitignore".freeze, "ext/phc-winner-argon2/.travis.yml".freeze, "ext/phc-winner-argon2/Argon2.sln".freeze, "ext/phc-winner-argon2/CHANGELOG.md".freeze, "ext/phc-winner-argon2/LICENSE".freeze, "ext/phc-winner-argon2/Makefile".freeze, "ext/phc-winner-argon2/README.md".freeze, "ext/phc-winner-argon2/appveyor.yml".freeze, "ext/phc-winner-argon2/argon2-specs.pdf".freeze, "ext/phc-winner-argon2/export.sh".freeze, "ext/phc-winner-argon2/include".freeze, "ext/phc-winner-argon2/include/argon2.h".freeze, "ext/phc-winner-argon2/kats".freeze, "ext/phc-winner-argon2/kats/argon2d".freeze, "ext/phc-winner-argon2/kats/argon2d.shasum".freeze, "ext/phc-winner-argon2/kats/argon2d_v16".freeze, "ext/phc-winner-argon2/kats/argon2d_v16.shasum".freeze, "ext/phc-winner-argon2/kats/argon2i".freeze, "ext/phc-winner-argon2/kats/argon2i.shasum".freeze, "ext/phc-winner-argon2/kats/argon2i_v16".freeze, "ext/phc-winner-argon2/kats/argon2i_v16.shasum".freeze, "ext/phc-winner-argon2/kats/check-sums.ps1".freeze, "ext/phc-winner-argon2/kats/check-sums.sh".freeze, "ext/phc-winner-argon2/kats/test.ps1".freeze, "ext/phc-winner-argon2/kats/test.sh".freeze, "ext/phc-winner-argon2/man".freeze, "ext/phc-winner-argon2/man/argon2.1".freeze, "ext/phc-winner-argon2/src".freeze, "ext/phc-winner-argon2/src/argon2.c".freeze, "ext/phc-winner-argon2/src/bench.c".freeze, "ext/phc-winner-argon2/src/blake2".freeze, "ext/phc-winner-argon2/src/blake2/blake2-impl.h".freeze, "ext/phc-winner-argon2/src/blake2/blake2.h".freeze, "ext/phc-winner-argon2/src/blake2/blake2b.c".freeze, "ext/phc-winner-argon2/src/blake2/blamka-round-opt.h".freeze, "ext/phc-winner-argon2/src/blake2/blamka-round-ref.h".freeze, "ext/phc-winner-argon2/src/core.c".freeze, "ext/phc-winner-argon2/src/core.h".freeze, "ext/phc-winner-argon2/src/encoding.c".freeze, "ext/phc-winner-argon2/src/encoding.h".freeze, "ext/phc-winner-argon2/src/genkat.c".freeze, "ext/phc-winner-argon2/src/genkat.h".freeze, "ext/phc-winner-argon2/src/opt.c".freeze, "ext/phc-winner-argon2/src/opt.h".freeze, "ext/phc-winner-argon2/src/ref.c".freeze, "ext/phc-winner-argon2/src/ref.h".freeze, "ext/phc-winner-argon2/src/run.c".freeze, "ext/phc-winner-argon2/src/test.c".freeze, "ext/phc-winner-argon2/src/thread.c".freeze, "ext/phc-winner-argon2/src/thread.h".freeze, "ext/phc-winner-argon2/vs2015".freeze, "ext/phc-winner-argon2/vs2015/Argon2Opt".freeze, "ext/phc-winner-argon2/vs2015/Argon2Opt/Argon2Opt.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2Opt/Argon2Opt.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptBench".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptBench/Argon2OptBench.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptBench/Argon2OptBench.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptGenKAT".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptGenKAT/Argon2OptGenKAT.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptGenKAT/Argon2OptGenKAT.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptTestCI".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptTestCI/Argon2OptTestCI.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2OptTestCI/Argon2OptTestCI.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2Ref".freeze, "ext/phc-winner-argon2/vs2015/Argon2Ref/Argon2Ref.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2Ref/Argon2Ref.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefBench".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefBench/Argon2RefBench.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefBench/Argon2RefBench.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefGenKAT".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefGenKAT/Argon2RefGenKAT.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefGenKAT/Argon2RefGenKAT.vcxproj.filters".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefTestCI".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefTestCI/Argon2RefTestCI.vcxproj".freeze, "ext/phc-winner-argon2/vs2015/Argon2RefTestCI/Argon2RefTestCI.vcxproj.filters".freeze, "ext/sulong-stub".freeze, "ext/sulong-stub/pthread.c".freeze, "ext/sulong-stub/pthread.h".freeze, "lib/argon2.rb".freeze, "lib/argon2/cext/.empty".freeze, "lib/argon2/cext_engine.rb".freeze, "lib/argon2/constants.rb".freeze, "lib/argon2/engine.rb".freeze, "lib/argon2/errors.rb".freeze, "lib/argon2/ffi_engine.rb".freeze, "lib/argon2/version.rb".freeze]
  s.homepage = "https://github.com/technion/ruby-argon2".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.6".freeze
  s.summary = "Argon2 Password hashing binding".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ffi>.freeze, ["~> 1.9"])
      s.add_runtime_dependency(%q<ffi-compiler>.freeze, ["~> 0.1"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.10.5", "~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.4.2", "~> 10.4"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.35"])
      s.add_development_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
    else
      s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
      s.add_dependency(%q<ffi-compiler>.freeze, ["~> 0.1"])
      s.add_dependency(%q<bundler>.freeze, [">= 1.10.5", "~> 1.10"])
      s.add_dependency(%q<rake>.freeze, [">= 10.4.2", "~> 10.4"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.35"])
      s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
    end
  else
    s.add_dependency(%q<ffi>.freeze, ["~> 1.9"])
    s.add_dependency(%q<ffi-compiler>.freeze, ["~> 0.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 1.10.5", "~> 1.10"])
    s.add_dependency(%q<rake>.freeze, [">= 10.4.2", "~> 10.4"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.8"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.35"])
    s.add_dependency(%q<codeclimate-test-reporter>.freeze, ["~> 0.4"])
  end
end
