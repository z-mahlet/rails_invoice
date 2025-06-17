require 'rails_helper'

RSpec.describe "Invoices API", type: :request do
  let!(:customer) { create(:customer) }
  let!(:invoice) { create(:invoice, customer: customer) }

  describe "GET /invoices" do
    it "returns invoices" do
      get "/invoices"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /invoices/:id" do
    it "returns an invoice" do
      get "/invoices/#{invoice.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /invoices" do
    it "creates an invoice" do
      post "/invoices", params: {
        invoice: {
          invoice_number: "INV123",
          generated_on: Date.today,
          status: "pending",
          customer_id: customer.id
        }
      }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /invoices/:id" do
    it "updates an invoice" do
      patch "/invoices/#{invoice.id}", params: { invoice: { status: "completed" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /invoices/:id" do
    it "deletes an invoice" do
      delete "/invoices/#{invoice.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end