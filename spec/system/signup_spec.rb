require "rails_helper"

RSpec.describe "Signup", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "owner signs up for a new account" do
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
    expect(page).to have_text("My Property Dashboard")
    expect(page).to have_text("john@email.com")
  end

  it "shows form errors" do
    visit root_path
    click_on "signup"
    click_on "signup-submit"
    expect(page).to have_text("First name can't be blank")
  end
end
