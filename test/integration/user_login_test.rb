require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test 'unauthenticated user can sign up' do
    visit root_path
    assert page.has_content?("Sign Up")
    assert page.has_content?("Email address")
    fill_in "user[email]", with: "stevepentler@gmail.com"
    assert page.has_content?("Password")
    fill_in "user[password]", with: "GoBadgers"
    assert page.has_content?("Password confirmation")
    fill_in "user[password_confirmation]", with: "GoBadgers"
    click_on "Create Account"

    assert_equal links_path, current_path

  end
end
