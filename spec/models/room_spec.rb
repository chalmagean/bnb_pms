require 'rails_helper'

RSpec.describe Room, type: :model do
  it { is_expected.to belong_to(:property) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:kind) }
  it { is_expected.to validate_inclusion_of(:kind).in_array(Room::KINDS) }
end
