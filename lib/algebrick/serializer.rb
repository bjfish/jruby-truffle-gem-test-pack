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


module Algebrick
  class Serializer
    include TypeCheck

    TYPE_KEY  = :algebrick_type
    FIELD_KEY = :algebrick_fields

    def load(data, options = {})
      case data
      when ::Hash
        parse_value(data, options)
      when Numeric, String, ::Array, Symbol, TrueClass, FalseClass, NilClass
        data
      else
        parse_other(data, options)
      end
    end

    def dump(object, options = {})
      case object
      when Value
        generate_value object, options
      when Numeric, String, ::Array, ::Hash, Symbol, TrueClass, FalseClass, NilClass
        object
      else
        generate_other(object, options)
      end
    end

    def constantize(camel_cased_word)
      names = camel_cased_word.split('::')
      names.shift if names.empty? || names.first.empty?

      parameter = nil
      names.last.tap do |last|
        name, parameter = last.split /\[|\]/
        last.replace name
      end

      constant = Object
      names.each do |name|
        constant = if constant.const_defined?(name)
                     constant.const_get(name)
                   else
                     constant.const_missing(name)
                   end
      end
      constant = constant[constantize(parameter)] if parameter
      constant
    end

    protected

    def parse_other(other, options = {})
      other
    end

    def generate_other(object, options = {})
      case
      when object.respond_to?(:to_h)
        object.to_h
      when object.respond_to?(:to_hash)
        object.to_hash
      else
        raise "do not know how to convert (#{object.class}) #{object}"
      end
    end

    private

    def parse_value(value, options)
      type_name = value[TYPE_KEY] || value[TYPE_KEY.to_s]
      if type_name
        type = constantize(type_name)

        fields = value[FIELD_KEY] || value[FIELD_KEY.to_s] ||
            value.dup.tap { |h| h.delete TYPE_KEY; h.delete TYPE_KEY.to_s }
        Type! fields, Hash, Array

        if type.is_a? Atom
          type
        else
          case fields
          when Array
            type[*fields.map { |value| load value, options }]
          when Hash
            type[fields.inject({}) do |h, (name, value)|
                   raise ArgumentError unless type.field_names.map(&:to_s).include? name.to_s
                   h.update name.to_sym => load(value, options)
                 end]
          end
        end
      else
        parse_other value, options
      end
    end

    def generate_value(value, options)
      { TYPE_KEY => value.type.name }.
          update(case value
                 when Atom
                   {}
                 when ProductConstructors::Basic
                   { FIELD_KEY => value.fields.map { |v| dump v, options } }
                 when ProductConstructors::Named
                   value.type.field_names.inject({}) do |h, name|
                     h.update name => dump(value[name], options)
                   end
                 else
                   raise
                 end)
    end
  end
end
