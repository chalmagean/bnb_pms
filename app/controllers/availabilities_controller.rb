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
end
