# This is a compatibility layer for using the pure Ruby postgres-pr instead of
# the C interface of postgres.

puts 'pg in postgres-pr'

require 'postgres-pr/postgres-compat'
