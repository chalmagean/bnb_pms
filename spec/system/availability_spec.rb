require "rails_helper"

RSpec.describe "Availability", type: :system do
  it "users can define availability" do
    sign_up
    setup_property
    click_on "edit-availability"
    fill_in "availability-rate-2024-04-01-double", with: "100"
    fill_in "availability-qty-2024-04-01-double", with: "2"
    click_on "availability-submit"
    expect(page).to have_text("Property updated successfully")
    expect(page).to have_selector(:xpath, ".//input[@id='availability-rate-2024-04-01-double' and @value='100.0']")
    expect(page).to have_selector(:xpath, ".//input[@id='availability-qty-2024-04-01-double' and @value='2']")
  end

  it "users can update availability in bulk" do
    sign_up
    setup_property
    click_on "edit-availability"
    fill_in "availability-start-date", with: "01-04-2024"
    fill_in "availability-end-date", with: "10-04-2024"
    select "double", from: "availability-room-type"
    fill_in "availability-rate", with: "100"
    fill_in "availability-qty", with: "2"
    click_on "bulk-availability-submit"

    expect(page).to have_text("Property updated successfully")
    expect(page).to have_selector(:xpath, ".//input[@id='availability-rate-2024-04-01-double' and @value='100.0']")
    expect(page).to have_selector(:xpath, ".//input[@id='availability-qty-2024-04-01-double' and @value='2']")
  end
end
