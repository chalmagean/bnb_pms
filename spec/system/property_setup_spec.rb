require "rails_helper"

RSpec.describe "Property setup", type: :system do
  it "users can define rooms" do
    sign_up
    click_on "property-setup"
    click_on "add-room"
    room_forms = all(".nested-form-wrapper")
    within(room_forms.first) do
      # TODO: find a different selector for the room name and type
      # as the current one is not unique.
      find(".room-name").set("Room 1")
      find(".room-type").set("double")
    end
    click_on "add-room-submit"
    expect(page).to have_text("Property updated successfully")
    expect(page).to have_selector(:xpath, './/input[@value="Room 1"]')
  end
end
