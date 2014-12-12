# This is the object that all of the cucumber steps run within. So instance methods
# that are defined in this class are available to all step definitions.
# Ref: https://github.com/cucumber/cucumber/wiki/A-Whole-New-World

module PSUPolice

  def create_my_user
    create :user, email: my_email, password: my_password
  end

  def my_email
    "joe@example.com"
  end

  def my_password
    "w3e4r5t6"
  end

  def path_for(description)
    known_paths = {
      "site's home page" => root_path,
      "user home page" => users_home_path,
      "login page" => new_user_session_path,
      "new password page" => new_user_password_path,
      "events index page" => events_path,
      "new event page" => new_event_path
    }
    expected_path = known_paths[description]
    expected_path.try(:call) || expected_path || fail("Unknown page #{description.inspect}")
  end

  def sign_in
    visit new_user_session_path
    fill_in "Email", with: my_email
    fill_in "Password", with: my_password
    click_button "Log in"
  end

  def message_for(description)
    {
      "that I am already logged in" => I18n.t('devise.failure.already_authenticated'),
      "that I logged in successfully" => I18n.t('devise.sessions.signed_in'),
      "that my login failed" => I18n.t('devise.failure.not_found_in_database'),
      "that I successfully logged out" => I18n.t('devise.sessions.signed_out'),
      "that I successfully logged in" => I18n.t('devise.sessions.signed_in'),
      "that I need to login to continue" => I18n.t('devise.failure.unauthenticated'),
      "that a new event has been saved" => 'The new event was successfully saved',
      "that the event was edited" => "Changes were successfully saved for",
      "that the event was deleted" => "has been deleted"
    }[description] or fail "Unknown message #{description.inspect}"
  end

end

World(PSUPolice)
