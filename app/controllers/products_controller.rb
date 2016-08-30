class ProductsController < ApplicationController
  include CurrentCart
  before_action :find_cart, only: [:line_item_create]
  before_action :authenticate_user!, except: :show
  before_action :check_for_admin, except: [:show, :line_item_create]

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

  def update
  	@product = Product.find(params[:id])
  	@product.update(product_params)
  		if @product.save
  			redirect_to @product
  		else
  			render :edit
  		end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  def line_item_create
    product = Product.find(params[:product_id])
    @line_item = @cart.line_items.build(products: product)
    if @line_item.save
      redirect_to cart_path(@line_item.cart)
    else
      redirect_to @product
    end
  end

  private
    
    def line_item_params
      params.require(:line_item).permit(:cart_id, :product_id)
    end

    def product_params
      params.require(:product).permit(:name, :quantity, :price, :description, :promoted)
    end

    def check_for_admin
      unless current_user.admin?
        redirect_to root_path
      end
    end

end


















