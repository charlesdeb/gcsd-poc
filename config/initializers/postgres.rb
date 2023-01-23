# frozen_string_literal: true

require 'active_record/connection_adapters/postgresql_adapter'

# Ensure the default datatype for datetime includes a timezone
# This will only work for postgres.
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type =
  :timestamptz
