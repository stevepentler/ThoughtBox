require 'test_helper'

class UserSubmitsLinkTest < ActionDispatch::IntegrationTest
  test "user views submit link form" do
    login
    assert page.has_content?("Title")
    assert page.has_content?("Url")
  end

  test "user submits valid link" do
    login
    assert_difference 'Link.count', 1 do
      fill_in "link[title]", with: "Google"
      fill_in "link[url]", with: "https://www.google.com/"
      click_on "Submit Link"
    end

    assert links_path, current_path
  end


  def login
    user = User.create(email: "stevepentler@gmail.com",
                       password: "GoBadgers")
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on "Welcome Back"

  end
end
