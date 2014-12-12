Konacha.configure do |config|
  require 'capybara/poltergeist'
  config.driver = :poltergeist
  config.spec_dir = "spec/component/javascripts"
  config.spec_matcher = /_spec\./
  config.stylesheets = %w(application)
end if defined?(Konacha)
