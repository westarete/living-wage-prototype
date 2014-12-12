require_relative 'system_spec_helper'

describe 'On the deployed application', type: :system do

  specify "I can see the home page" do
    visit '/'
    expect(page).to have_content("Living Wage Calculator")
  end

end
