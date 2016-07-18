# JRuby+Truffle Gem Test Pack

## Direct usage

These are the gems needed to run JRuby+Truffle's `test gems` command without
having to download anything. To use them, set `$GEM_HOME` to the `gems`
directory. 

To add a new gem or update an existing one, `gem install` it with `$GEM_HOME`
set.

## `jruby+truffle` tool usage

The tool has options to use this repository `jruby+truffle ci --offline
<gem-name>` (also se `--offline-gem-path` option).

To add gems for ecosystem tests merge their `.jruby+truffle_bundle/jruby/2.3.0`
with `./gems`, e.g.:

    rsync -a rails/activemodel/.jruby+truffle_bundle/jruby/2.3.0/ \
    ../../../../../jruby-truffle-gem-test-pack/gems/

If the dependencies of the gem have a gem pulled from git, the dir containing
the GIT repository can be added with:

    git add gems/bundler/gems/qu-d098e2657c92/ 
    # the last `/` is significant

## `gem-testing` directory

`gem-testing` directory contains repository clones of gems which are tested in
CI. They are added using `git-subtree` as follows:

    git remote add rails https://github.com/rails/rails.git
    git fetch rails
    git subtree add --prefix=gem-testing/rails --squash rails v4.2.6

`jt test ecosystem` will use the `gem-testing` directory.

## Licenses

See individual gems.
