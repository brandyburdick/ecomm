class WelcomeController < ApplicationController
  def index
  	@products = Product.promoted
  end
end
