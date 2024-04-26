class RemoveReservationIdFromGuests < ActiveRecord::Migration[7.1]
  def change
    remove_reference :guests, :reservation, null: false, foreign_key: true
  end
end
