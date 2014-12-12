require 'database_cleaner'
require 'database_cleaner/cucumber'

# Use truncation to clean the database to ensure we're compatible with poltergeist/ajax.
DatabaseCleaner.strategy = :truncation

# Now use truncation to start the suite with an empty database.
DatabaseCleaner.clean_with(:truncation)

# Clean the database for each feature.
Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end
