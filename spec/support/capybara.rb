require 'capybara/rspec'
require 'capybara/dsl'

# Tell capybara to use css selectors, as opposed to xpath
Capybara.default_selector = :css

# Put temp files with the rest of the rails files
Capybara.save_and_open_page_path = Pathname.new(File.expand_path(File.dirname(__FILE__) + '/../../tmp'))

RSpec.configure do |config|
  config.include(Capybara::DSL)
end
