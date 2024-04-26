class ReservationForm
  include ActiveModel::Model

  attr_accessor(
    :first_name,
    :last_name,
    :address,
    :city,
    :country,
    :email,
    :phone,
    :check_in,
    :check_out,
    :room_type,
    :quantity,
    :property_id
  )

  validate :guest_valid?
  validate :reservation_valid?

  def save
    return unless valid?

    guest.save
    guest.reservations << reservation
  end

  private

    def guest
      @guest ||= Guest.new(guest_params)
    end

    def reservation
      @reservation ||= Reservation.new(reservation_params)
    end

    def guest_valid?
      return true if guest.valid?

      guest.errors.each do |error|
        errors.add(error.attribute.to_sym, error.message)
      end
    end

    def reservation_valid?
      return true if reservation.valid?

      reservation.errors.each do |error|
        errors.add(error.attribute.to_sym, error.message)
      end
    end

    def guest_params
      {
        first_name: first_name,
        last_name: last_name,
        address: address,
        city: city,
        country: country,
        email: email,
        phone: phone
      }
    end

    def reservation_params
      {
        check_in: check_in,
        check_out: check_out,
        room_type: room_type,
        quantity: quantity,
        property_id: property_id
      }
    end
end
