require "rails_helper"

RSpec.describe ReservationForm, type: :model do
  it "validates the guest model" do
    form = ReservationForm.new
    form.valid?

    expect(form.errors.messages[:first_name]).to include("can't be blank")
    expect(form.errors.messages[:last_name]).to include("can't be blank")
  end

  it "validates the reservation model" do
    form = ReservationForm.new
    form.valid?

    expect(form.errors.messages[:check_in]).to include("can't be blank")
    expect(form.errors.messages[:check_out]).to include("can't be blank")
    expect(form.errors.messages[:room_type]).to include("can't be blank")
    expect(form.errors.messages[:quantity]).to include("can't be blank")
  end

  describe "#save" do
    it "saves all models if they're valid" do
      property = create(:property)

      form = ReservationForm.new(
        first_name: "John",
        last_name: "Doe",
        address: "Str. Main 1",
        city: "San Francisco",
        country: "USA",
        email: "jdoe@email.com",
        phone: "1234567890",
        check_in: Date.today,
        check_out: 4.days.from_now,
        room_type: "double",
        quantity: 1,
        property_id: property.id
      )
      form.save
      expect(Guest.count).to eq(1)
      expect(Reservation.count).to eq(1)
      guest = Guest.first
      expect(guest.reservations.count).to eq(1)
    end
  end
end
