class AddRoomIdToAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_reference :availabilities, :room, null: false, foreign_key: true
  end
end
