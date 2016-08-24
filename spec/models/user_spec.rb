require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'name' do
  	it "can't be nil" do
  		user = FactoryGirl.build(:user, name: nil)
  		expect(user).to be_invalid
  	end
  end
end
