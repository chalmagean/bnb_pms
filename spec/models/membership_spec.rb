require "rails_helper"

RSpec.describe Membership, type: :model do
  it { is_expected.to validate_presence_of(:role) }
end
