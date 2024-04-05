class CreateAvailabilities < ActiveRecord::Migration[7.1]
  def change
    create_table :availabilities do |t|
      t.date :date
      t.string :room_type
      t.decimal :rate, precision: 8, scale: 2

      t.timestamps
    end
  end
end
