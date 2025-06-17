require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it { should belong_to(:invoice) }
  it { should belong_to(:item) }

  it { should validate_presence_of(:invoice_id) }
  it { should validate_presence_of(:item_id) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:price) }
end
