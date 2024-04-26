class AvailabilitiesController < ApplicationController
  def index
    @days = Date.current.end_of_month.day
    @date_start = Date.current.beginning_of_month
    @date_end = Date.current.end_of_month
    @availabilities = Availability
      .joins(:property)
      .where(date: @date_start..@date_end)
      .all
  end

  def create
    start_date, end_date, room_type, rate, qty = availability_params
      .values_at(:start_date, :end_date, :room_type, :rate, :quantity)
    hash = {}
    (start_date..end_date).each_with_index do |date, i|
      hash[i] = { date: date, rate: rate, quantity: qty, room_type: room_type }
    end

    if current_property.update(availabilities_attributes: hash)
      redirect_to property_availabilities_path(current_property),
        notice: "Property updated successfully"
    else
      render :edit
    end
  end

  private

    def availability_params
      params
        .require(:availability)
        .permit!
    end
end
