class AddAccountIdToProperties < ActiveRecord::Migration[7.1]
  def change
    add_reference :properties, :account, null: false, foreign_key: true
  end
end
