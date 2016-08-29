require 'rails_helper'

def make_a_product
	let(:product) {FactoryGirl.create(:product)}
end

describe "routes for Products" do
	make_a_product
	it "routes /products to products#index" do
		expect(get: "/products").to route_to(controller: "products", action: "index")
	end
	it "routes /products/:id to products#show" do
		expect(get: "products/#{product.id}").to route_to(controller: "products", action: "show", id: "#{product.id}")
	end
	it "routes /products/new to products#new" do
		expect(get: "/products/new").to route_to(controller: "products", action: "new")
	end
	it "routes /products/:id/edit to products#edit" do
		expect(get: "/products/#{product.id}/edit").to route_to(controller: "products", action: "edit", id: "#{product.id}")
	end
	it "Delete routes /products/:id to products#destroy" do
		expect(delete: "/products/#{product.id}").to route_to(controller: "products", action: "destroy", id: "#{product.id}")
	end
	it "Create routes /products to products#create" do
		expect(post: "/products").to route_to(controller: "products", action: "create")
	end
end