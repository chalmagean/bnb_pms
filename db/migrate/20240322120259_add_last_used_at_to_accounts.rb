class AddLastUsedAtToAccounts < ActiveRecord::Migration[7.1]
  def change
    add_column :properties, :last_used_at, :datetime
  end
end
