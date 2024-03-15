class AddFirstLastNameToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false, default: nil
    add_column :users, :last_name, :string, null: false, default: nil
  end
end
