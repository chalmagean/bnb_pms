require "rails_helper"

RSpec.describe Account, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:properties).dependent(:destroy) }
  it { is_expected.to have_many(:memberships).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:memberships) }

  describe "property" do
    it "returns the last property used" do
      account = create(:account)
      property1 = create(:property, account: account)
      property2 = create(:property, account: account)

      property1.update(last_used_at: 1.day.ago)
      property2.update(last_used_at: 2.day.ago)

      expect(account.property).to eq(property1)
    end
  end
end
