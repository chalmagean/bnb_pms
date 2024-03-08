require "rails_helper"

RSpec.describe Account, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_many(:properties).dependent(:destroy) }
  it { is_expected.to have_many(:memberships).dependent(:destroy) }
  it { is_expected.to have_many(:users).through(:memberships) }
end
