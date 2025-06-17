require 'rails_helper'

RSpec.describe "Customers API", type: :request do
  let!(:customer) { create(:customer) }

  describe "GET /customers" do
    it "returns customers" do
      get "/customers"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).not_to be_empty
    end
  end

  describe "GET /customers/:id" do
    it "returns a customer" do
      get "/customers/#{customer.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /customers" do
    it "creates a customer" do
      post "/customers", params: { customer: { code: "NEW123", name: "New One" } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /customers/:id" do
    it "updates a customer" do
      patch "/customers/#{customer.id}", params: { customer: { name: "Updated Name" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /customers/:id" do
    it "deletes a customer" do
      delete "/customers/#{customer.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end