require 'rails_helper'

RSpec.describe Reservation, type: :model do
  # Association test
  # ensure an item record belongs to a single room record and user record
  it { should belong_to(:room) }
  it { should belong_to(:user) }
  # Validation tests
  # ensure columns check_in, check_out and total_price are present before saving
  it { should validate_presence_of(:check_in) }
  it { should validate_presence_of(:check_out) }
  it { should validate_presence_of(:total_price) }
end
