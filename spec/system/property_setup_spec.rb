require "rails_helper"

RSpec.describe "Property setup", type: :system do
  it "users can define rooms" do
    sign_up
    click_on "property-setup"
    click_on "add-room"
    room_forms = all(".nested-form-wrapper")
    within(room_forms.first) do
      fill_in "Room name", with: "Room 1"
      select "double", from: "Room type"
    end
    click_on "add-room-submit"
    expect(page).to have_text("Property updated successfully")
    expect(page).to have_selector(:xpath, './/input[@value="Room 1"]')
  end
end
