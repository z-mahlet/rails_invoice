require 'rails_helper'

RSpec.describe "Items API", type: :request do
  let!(:item) { create(:item) }

  describe "GET /items" do
    it "returns items" do
      get "/items"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /items/:id" do
    it "returns an item" do
      get "/items/#{item.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /items" do
    it "creates an item" do
      post "/items", params: { item: { code: "ITEM123", name: "Screwdriver" } }
      expect(response).to have_http_status(:created)
    end
  end

  describe "PATCH /items/:id" do
    it "updates an item" do
      patch "/items/#{item.id}", params: { item: { name: "Updated Tool" } }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "DELETE /items/:id" do
    it "deletes an item" do
      delete "/items/#{item.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end