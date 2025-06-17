require 'rails_helper'

RSpec.describe "InvoiceItems API", type: :request do
  let!(:invoice) { create(:invoice) }
  let!(:item) { create(:item) }
  let!(:invoice_item) { create(:invoice_item, invoice: invoice, item: item) }

  describe "GET /invoice_items" do
    it "returns invoice_items" do
      get "/invoice_items"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /invoice_items/:id" do
    it "returns an invoice_item" do
      get "/invoice_items/#{invoice_item.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /invoice_items" do
    it "creates an invoice_item" do
      post "/invoice_items", params: {
        invoice_item: {
          invoice_id: invoice.id,
          item_id: item.id,
          quantity: 2.5,
          price: 15.99
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /invoice_items/:id" do
    it "updates an invoice_item" do
      patch "/invoice_items/#{invoice_item.id}", params: { invoice_item: { quantity: 3.0 } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /invoice_items/:id" do
    it "deletes an invoice_item" do
      delete "/invoice_items/#{invoice_item.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end