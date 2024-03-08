class CreateProperties < ActiveRecord::Migration[7.1]
  def change
    create_table :properties do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :email, null: false
      t.string :city
      t.string :country
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
