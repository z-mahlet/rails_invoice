require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many(:invoice_items).dependent(:destroy) }
  it { should have_many(:invoices).through(:invoice_items) }
  it { should validate_presence_of(:code) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:code) }
end