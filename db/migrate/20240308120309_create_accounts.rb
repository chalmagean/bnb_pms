class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :name, null: false
      t.string :address
      t.string :email
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
