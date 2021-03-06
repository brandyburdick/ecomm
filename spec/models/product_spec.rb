#BEFORE REFACTORING

# require 'rails_helper'

# RSpec.describe Product, type: :model do
#   it "doesn't allow a product's name to be nil" do
#      macbook = FactoryGirl.build(:product, name: nil)
#      expect(macbook).to_not be_valid
#   end

#   it "doesn't allow a product's quantity to be nil" do
#      macbook = FactoryGirl.build(:product, quantity: nil)
#      expect(macbook).to_not be_valid
#   end

#   it "doesn't allow a product's quantity to be negative" do
#      macbook = FactoryGirl.build(:product, quantity: -1)
#      expect(macbook).to_not be_valid
#   end

# end

#AFTER REFACTORING
require 'rails_helper'

RSpec.describe Product, type: :model do
	
	describe "name" do
	  it "cannot be nil" do
	    product = FactoryGirl.build(:product, name: nil)
	  end
	end
	  
	describe "quantity" do
	  it "cannot be nil" do
	    product = FactoryGirl.build(:product, quantity: nil)
	    expect(product).to_not be_valid
	  end

	  it "cannot be negative" do
	    product = FactoryGirl.build(:product, quantity: -1)
	    expect(product).to_not be_valid
		end
	end

	describe "price" do
	  it "cannot have 3 or more numbers after the decimal point" do
	    product = FactoryGirl.build(:product, price: 78.456)
	    expect(product).to_not be_valid
	  end
	end

	describe "description" do
    it "cannot be nil" do
      product = FactoryGirl.build_stubbed(:product, description: nil)
      expect(product).to_not be_valid
    end
  end

  describe ".promoted" do
    it "returns products that are marked true for front_page" do
      product_list = FactoryGirl.create_list(:product, 2, promoted: true)
      expect(Product.promoted).to eq(product_list)
    end
  end
  
end



