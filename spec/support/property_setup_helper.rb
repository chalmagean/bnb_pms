module PropertySetupHelper
  def setup_property
    click_on "property-setup"
    click_on "add-room"
    room_forms = all(".nested-form-wrapper")
    within(room_forms.first) do
      find(".room-name").set("Room1")
      find(".room-type").set("double")
    end
    click_on "add-room-submit"
  end

  def setup_availability(from:, to:, room_type:, rate:, qty:)
    click_on "edit-availability"
    fill_in "availability-start-date", with: from
    fill_in "availability-end-date", with: to
    select room_type, from: "availability-room-type"
    fill_in "availability-rate", with: rate
    fill_in "availability-qty", with: qty
    click_on "bulk-availability-submit"
  end
end
