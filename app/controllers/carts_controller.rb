class CartsController < ApplicationController
  
  def show
  	@cart = Cart.find(params[:id])
  end
  
  def create
   	@cart = Cart.create(user_id: current_user.id)
   	if @cart.save
    	redirect_to @cart
   	else
    	redirect_to request.referrer
   	end
 	end

  def destroy
    @cart.destroy if @cart.id == session[:cart_id]
    session[:cart_id] = nil
    redirect_to root_path, notice: 'Your cart is currently empty.'
  end
  
end
