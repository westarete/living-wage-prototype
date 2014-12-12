# The fastest way to load the database is from the database dump file, like this.
# If you want to load it from scratch using the raw CSV files (much slower), then
# run `rake csv:import` instead. Both commands assume that you're starting with
# an empty database where the schema has already been loaded.
exec "psql living_wage_development < db/development.sql"
