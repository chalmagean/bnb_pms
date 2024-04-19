class AddQuantityToAvailabilities < ActiveRecord::Migration[7.1]
  def change
    add_column :availabilities, :quantity, :integer, default: 0, null: false
  end
end
