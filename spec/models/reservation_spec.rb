require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { is_expected.to validate_presence_of(:check_in) }
  it { is_expected.to validate_presence_of(:check_out) }
  it { is_expected.to validate_presence_of(:room_type) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to belong_to(:property) }
  it { is_expected.to have_many(:guests) }
end
