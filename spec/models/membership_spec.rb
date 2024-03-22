require "rails_helper"

RSpec.describe Membership, type: :model do
  subject { build(:membership) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:account) }

  describe "default role setting" do
    let(:account) { create(:account) }
    let(:user) { create(:user) }

    it "sets admin for the first user" do
      membership = Membership.new(user: user, account: account)
      membership.save
      expect(membership.role).to eq("admin")
    end

    it "sets member for all the other users" do
      user2 = create(:user)
      create(:membership, user: user, account: account)
      membership = build(:membership, user: user2, account: account)
      membership.save
      expect(membership.role).to eq("member")
    end
  end
end
