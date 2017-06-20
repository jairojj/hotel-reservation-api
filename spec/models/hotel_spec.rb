require 'rails_helper'

RSpec.describe Hotel, type: :model do
  # Association test
  # ensure Todo model has a 1:m relationship with the Room model
  it { should have_many(:rooms).dependent(:destroy) }
  # Validation tests
  # ensure columns name and localization are present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:localization) }
  
end
