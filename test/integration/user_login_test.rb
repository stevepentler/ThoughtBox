require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test 'unauthenticated user can login' do
    visit root_path

    assert page.has_content?("Email address")
    assert page.has_content?("Password")
    assert page.has_content?("Password confirmation")
  end
end
