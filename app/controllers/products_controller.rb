class ProductsController < ApplicationController
  def new
  	@product = Product.new
  end

	def create
  	@product = Product.create(product_params)
  	if @product.save
  		redirect_to @product
  	else
  		render :new
  	end
  end

  def index
  end

  def show
  end

  def edit
  end

end
