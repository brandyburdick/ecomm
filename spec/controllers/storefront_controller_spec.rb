require 'rails_helper'

RSpec.describe StorefrontController, type: :controller do

  describe "GET #all_items" do
    it "returns http success" do
      get :all_items
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #items_by_category" do
    it "returns http success" do
      get :items_by_category
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #items_by_brand" do
    it "returns http success" do
      get :items_by_brand
      expect(response).to have_http_status(:success)
    end
  end

end
