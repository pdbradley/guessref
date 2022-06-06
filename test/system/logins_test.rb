require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "visiting the new session page" do
    visit new_session_url
    
    assert_selector "p", text: "Login"
  end
end
