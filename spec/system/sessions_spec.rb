require "rails_helper"

RSpec.describe "Sessions", type: :system do
  before do
    driven_by(:rack_test)
  end

  it "users can sign out" do
    sign_up
    click_on "sign-out"
    expect(page).to have_text("Signed out successfully")
  end
end
