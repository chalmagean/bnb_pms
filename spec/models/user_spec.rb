require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  describe "account" do
    let(:user) { create(:user) }

    it "returns the last account used" do
      account1 = create(:account)
      account2 = create(:account)

      account1.users << user
      account2.users << user

      account1.memberships.where(user: user)
        .first
        .update(last_used_at: 1.day.ago)
      account2.memberships.where(user: user)
        .first
        .update(last_used_at: 2.day.ago)

      expect(user.account).to eq(account1)
    end
  end
end
