class CreateJoinTableGuestsReservations < ActiveRecord::Migration[7.1]
  def change
    create_join_table :guests, :reservations do |t|
      t.index %i[guest_id reservation_id]
      t.index %i[reservation_id guest_id]
    end
  end
end
