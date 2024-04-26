class CreateGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
