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
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

end
