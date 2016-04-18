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
    assert page.has_content?("Splendid Addition!")
  end

  test "user submits invalid link" do
    login
    assert_difference 'Link.count', 0 do
      fill_in "link[title]", with: "Invalid"
      fill_in "link[url]", with: "blah blah blah"
      click_on "Submit Link"
    end

    assert links_path, current_path
    assert page.has_content?("Invalid link, Try Again!")
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
