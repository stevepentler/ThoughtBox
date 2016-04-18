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

  test 'authenticated user can login' do
    user = User.create(email: "stevepentler@gmail.com",
                        password: "GoBadgers")
    visit root_path
    click_on "Login"
    assert page.has_content?("Email address")
    fill_in "session[email]", with: user.email
    assert page.has_content?("Password")
    fill_in "session[password]", with: user.password
    click_on "Welcome Back"

    assert_equal links_path, current_path

  end

  test 'authenticated user can logout' do
    user = User.create(email: "stevepentler@gmail.com",
                       password: "GoBadgers")
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Welcome Back"
    assert_equal links_path, current_path

    click_on "Logout"
    assert_equal login_path, current_path
  end
end
