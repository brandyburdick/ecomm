module CurrentCart
	private
		def find_cart
			@cart = Cart.find(session[:cart_id])
		rescue
			@cart = Cart.create(user_id: current_user.id)
			session[:cart_id] = @cart.id
		end
end