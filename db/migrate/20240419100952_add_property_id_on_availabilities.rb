class AddPropertyIdOnAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_reference :availabilities, :property, null: false, foreign_key: true
  end
end
