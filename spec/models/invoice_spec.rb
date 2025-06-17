require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it { should belong_to(:customer) }
  it { should have_many(:invoice_items).dependent(:destroy) }
  it { should have_many(:items).through(:invoice_items) }
  
  it do
    should define_enum_for(:status)
      .with_values(pending: 0, in_progress: 1, completed: 2)
      .backed_by_column_of_type(:integer)
  end

  it { should validate_presence_of(:invoice_number) }
  it { should validate_presence_of(:generated_on) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_uniqueness_of(:invoice_number) }
end