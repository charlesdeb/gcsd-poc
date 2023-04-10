# frozen_string_literal: true

# a trick to prevent attempts to connect to the database with a non-existent
# database.yml during assets:precompile
# from: https://stackoverflow.com/questions/8997226/rake-assetsprecompile-attempting-to-connect-to-database
# unless Rake.application.top_level_tasks.include? 'assets:precompile'

# Don't do database stuff if we're pre-compiling, because database.yml doesn't
# exist, and the following code assumes its existence
unless Rake.respond_to?(:application) && (Rake.application.top_level_tasks.include? 'assets:precompile')
  require 'active_record/connection_adapters/postgresql_adapter'

  # Ensure the default datatype for datetime includes a timezone
  # This will only work for postgres.
  ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.datetime_type =
    :timestamptz
end
