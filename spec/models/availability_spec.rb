require 'rails_helper'

RSpec.describe Availability, type: :model do
  it { is_expected.to belong_to(:property) }
end
