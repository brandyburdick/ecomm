require 'rails_helper'

RSpec.describe Product, type: :model do
  it "doesn't allow a product's name to be nil" do
     macbook = FactoryGirl.build(:product, name: nil)
     expect(macbook).to_not be_valid
   end
end
