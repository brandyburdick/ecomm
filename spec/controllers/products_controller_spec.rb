require 'rails_helper'

def make_a_product
  let(:product) {FactoryGirl.create(:product)}
end

RSpec.describe ProductsController, type: :controller do

  context "when NON admin user is logged in" do
    let(:user) {FactoryGirl.create(:non_admin_user)}
    before do
      sign_in(user)
    end
    
    describe "GET #new" do
      it "redirects to root_path" do
        get :new
        expect(response).to redirect_to root_path
      end
    end

    describe "GET #index" do
      it "redirects to root_path" do
        get :index
        expect(response).to redirect_to root_path
      end
    end

    describe "GET #edit" do
      make_a_product
      it "redirects to root_path" do
        get :edit, id: product
        expect(response).to redirect_to root_path
      end
    end

    describe "GET #show" do
      make_a_product
      it "returns http success" do
        get :show, id: product
        expect(response).to have_http_status(:success)
      end
      it "assigns requested product to @product" do
        get :show, id: product
        expect(assigns(:product)).to eq(product)
      end
    end

  end    

  context "when admin is logged in" do
    let(:admin) {FactoryGirl.create(:admin_user)}
    before do
      sign_in(admin)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, id: :product
        expect(response).to have_http_status(:success)
      end
      it "assigns @product to a new Product" do
        get :new, id: :product
        expect(assigns(:product)).to be_a_new(Product)
      end
    end

    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #show" do
      make_a_product
      it "returns http success" do
        get :show, id: product
        expect(response).to have_http_status(:success)
      end
      it "assigns requested product to @product" do
        get :show, id: product
        expect(assigns(:product)).to eq(product)
      end
    end

    describe "GET #edit" do
      make_a_product
      it "returns http success" do
        get :edit, id: product
        expect(response).to have_http_status(:success)
      end
      it "assigns requested product to @product" do
        get :edit, id: product
        expect(assigns(:product)).to eq(product)
      end
    end

    describe "POST #create" do
      it "creates a product" do
        post :create, product: FactoryGirl.attributes_for(:product)
        expect(Product.count).to eq(1)
        expect(response).to redirect_to(product_path(assigns[:product]))
      end
    end

    describe "Put #update" do
      make_a_product
      let(:product_params_hash) {FactoryGirl.attributes_for(:product, name: "Chromebook")}
      it "updates the attributes" do
        put :update, id: product, product: product_params_hash
        product.reload
        expect(product.name).to eq("Chromebook")
      end
      it "redirects_to show" do
        put :update, id: product, product: product_params_hash
        expect(response).to redirect_to(product)
      end
    end

    describe "Delete #destroy" do
      make_a_product
      it "deletes a product & redirects to the index page" do
        delete :destroy, id: product
        expect(response).to redirect_to(products_path)
      end
    end

  end
end








