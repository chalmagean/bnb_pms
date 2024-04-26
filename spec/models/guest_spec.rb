require 'rails_helper'

RSpec.describe Guest, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to have_and_belong_to_many(:reservations) }
end
