require "rails_helper"

RSpec.describe "Availability", type: :system do
  it "users can define availability" do
    sign_up
    setup_property
    click_on "edit-availability"
    room1_id = Room.find_by(name: "Room1").id
    fill_in "availability-2024-04-01-#{room1_id}", with: "100"
    click_on "availability-submit"
    expect(page).to have_text("Availability updated successfully")
    expect(page).to have_selector(:xpath, './/input[@id="availability-2024-04-01-#{room_id}" and @value="100"]')
  end
end
