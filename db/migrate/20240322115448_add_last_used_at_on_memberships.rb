class AddLastUsedAtOnMemberships < ActiveRecord::Migration[7.1]
  def change
    add_column :memberships, :last_used_at, :datetime
  end
end
