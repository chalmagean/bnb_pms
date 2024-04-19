class RemoveRoomIdFromAvailabilities < ActiveRecord::Migration[7.1]
  def change
    remove_column :availabilities, :room_id
  end
end
