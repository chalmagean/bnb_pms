require "rails_helper"

RSpec.describe "Property setup", type: :system do
  it "users can define rooms" do
    sign_up
    setup_property
    expect(page).to have_text("Property updated successfully")
    expect(page).to have_selector(:xpath, './/input[@value="Room1"]')
  end
end
