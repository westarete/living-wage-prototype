RSpec.configure do |config|

  # Allow direct use of .build and .create rather than having to say
  # FactoryGirl.build and FactoryGirl.create.
  config.include FactoryGirl::Syntax::Methods

  # Make sure all known factories produce #valid? objects. We need to
  # make sure the database is clean both before and after this check.
  DatabaseCleaner.clean_with(:truncation)
  FactoryGirl.lint
  DatabaseCleaner.clean_with(:truncation)

end
