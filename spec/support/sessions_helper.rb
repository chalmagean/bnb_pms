module SessionsHelper
  def sign_up
    visit root_path
    click_on "signup"
    fill_in "user-first-name", with: "John"
    fill_in "user-last-name", with: "Doe"
    fill_in "user-email", with: "john@email.com"
    fill_in "user-password", with: "password"
    fill_in "user-password-confirmation", with: "password"
    fill_in "propery-name", with: "My Property"
    fill_in "propery-address", with: "Main Str. 123"
    fill_in "propery-email", with: "prop@email.com"
    fill_in "account-name", with: "Acme Inc."
    click_on "signup-submit"
    expect(page).to have_text("Welcome john@email.com")
  end
end
