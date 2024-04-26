class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.date :check_in, null: false
      t.date :check_out, null: false
      t.string :room_type, null: false
      t.integer :quantity, null: false
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
