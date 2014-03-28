/*
 * The webshop's cart-related sub view-model.
 */
$(function(){
	window.CartViewModel = function CartViewModel(){
		var self = this;
		this.cartContent = ko.observableArray();
		
		this.totalCartNumberOfItems = ko.computed(function(){
			var numberOfItemsInCart = 0;
			ko.utils.arrayForEach(self.cartContent(), function(product) {
				numberOfItemsInCart++;
			});
			return numberOfItemsInCart;			
		},this);
		
		this.totalCartPrice = ko.computed(function(){
			var totalCartValue = 0;
			ko.utils.arrayForEach(self.cartContent(), function(product) {
				totalCartValue+=product['price'];
		    });
			return totalCartValue;			
		},this);
		
		this.checkout = function(){
			//TODO send order here
			console.log("Order has been submitted...");
			self.clearCart();
		};
		
		this.clearCart = function(){
			self.cartContent([]);
		};
	};
	
});