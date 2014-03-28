class ApplicationController < ActionController::Base
  before_filter :fetch_cart
  before_filter :fetch_categories

  protect_from_forgery
  include SessionsHelper

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  def fetch_categories
        @categories = Category.find(:all)
  end

  def fetch_cart
  	@cart = current_cart
  end

  private

	def current_cart
		Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
	 		cart = Cart.create
			session[:cart_id] = cart.id
	 		cart
	end
	
end
