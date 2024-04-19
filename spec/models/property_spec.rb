require "rails_helper"

RSpec.describe Property, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to have_many(:rooms).dependent(:destroy) }
  it { is_expected.to have_many(:availabilities).dependent(:destroy) }
  it { is_expected.to belong_to(:account) }
  it { is_expected.to accept_nested_attributes_for(:rooms) }
end
