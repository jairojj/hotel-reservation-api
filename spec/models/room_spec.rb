require 'rails_helper'

RSpec.describe Room, type: :model do
  # Association test
  # ensure an item record belongs to a single hotel record
  it { should belong_to(:hotel) }
  # Validation test
  # ensure column max_quantity, daily_price is present before saving
  it { should validate_presence_of(:max_quantity) }
  it { should validate_presence_of(:daily_price) }
end
