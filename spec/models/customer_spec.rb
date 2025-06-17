require 'rails_helper'

RSpec.describe Customer, type: :model do
  it { should have_many(:invoices).dependent(:destroy)}
  it { should validate_presence_of(:code) }
  it { should validate_uniqueness_of(:code) }
  it { should validate_presence_of(:name) }
end
