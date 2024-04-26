require "rails_helper"

RSpec.describe "Reservations", type: :system do
  it "users can create a reservation" do
    sign_up
    setup_property
    check_in = Date.today.strftime("%d-%m-%Y")
    check_out = 4.days.from_now.strftime("%d-%m-%Y")
    setup_availability(
      from: check_in,
      to: check_out,
      room_type: "double",
      rate: "100",
      qty: "2"
    )
    click_on "property-reservations"
    click_on "new-reservation"
    fill_in "reservation-first-name", with: "John"
    fill_in "reservation-last-name", with: "Doe"
    fill_in "reservation-address", with: "Str. Main 1"
    fill_in "reservation-city", with: "San Francisco"
    fill_in "reservation-country", with: "USA"
    fill_in "reservation-email", with: "jdoe@email.com"
    fill_in "reservation-phone", with: "1234567890"
    fill_in "reservation-check-in", with: check_in
    fill_in "reservation-check-out", with: check_out
    select "double", from: "reservation-room-type"
    fill_in "reservation-qty", with: "1"
    click_on "reservation-submit"
    expect(page).to have_text("Reservation created successfully")
    expect(page).to have_text("John Doe").once
    expect(page).to have_text("Double").once
    expect(page).to have_text("1").once
    expect(page).to have_text(check_in).once
    expect(page).to have_text(check_out).once
  end
end
