class ReservationsController < ApplicationController
  def index
    @reservations = current_property.reservations
  end

  def new
    @reservation = ReservationForm.new
  end

  def create
    @reservation = ReservationForm.new(reservation_params)
    @reservation.property_id = current_property.id

    if @reservation.save
      flash[:notice] = "Reservation created successfully"
      redirect_to reservations_path(current_property)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def reservation_params
      params
        .require(:reservation)
        .permit!
    end
end
