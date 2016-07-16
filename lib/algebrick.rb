#  Copyright 2013 Petr Chalupa <git+algebrick@pitr.ch>
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.


# TODO method definition in variant type defines methods on variants based on match, better performance?
# TODO add matcher/s for Hash
# TODO add method matcher (:size, matcher)
# TODO Menu modeling example, add TypedArray
# TODO update actor pattern example when gem is done
# TODO gemmify reclude
# TODO gemmify typecheck

# TODO add default field values
# Person = Algebrick.type do
#   fields! age:     Integer,
#           address: [Maybe[String], None]#,
#           # address: Maybe[String] >> None
#
#   field! :age, Integer
#   field! :address, Maybe[String], None
# end
# Person[1]
# Person[1, Some['Praha']]

# TODO use benevolent deserializer to allow:
# Person[address: Address[name: 'asd']]
# Person[address: { name: 'asd' }]

# Provides Algebraic types and pattern matching
#
# **Quick example**
# {include:file:doc/quick_example.out.rb}
module Algebrick

  def self.version
    @version ||= Gem::Version.new File.read(File.join(File.dirname(__FILE__), '..', 'VERSION'))
  end

  require 'algebrick/reclude'
  require 'algebrick/type_check'
  require 'algebrick/matching'
  require 'algebrick/matcher_delegations'
  require 'algebrick/type'
  require 'algebrick/value'
  require 'algebrick/atom'
  require 'algebrick/product_constructors'
  require 'algebrick/field_method_readers'
  require 'algebrick/product_variant'
  require 'algebrick/parametrized_type'
  require 'algebrick/dsl'
  require 'algebrick/matchers'
  require 'algebrick/types'

end
