Capybara.default_driver = :poltergeist
Capybara.app = :remote
Capybara.app_host = "http://staging.livingwage.westarete.com"
puts "Running tests against #{Capybara.app_host}"
