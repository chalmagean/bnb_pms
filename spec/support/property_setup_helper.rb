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
end
