/* 
 * The webshop's view-model.
 */
$(function() {
	window.WebShopViewModel = function WebShopViewModel(){
		var self = this;
		
		this.productsViewModel = new window.ProductsViewModel();
		this.cartViewModel = new window.CartViewModel();
		
		
		this.activeTemplateName=ko.observable(""); //don't display any of the sub-pages by default
		
	
		this.productCategoriesMenuItemClicked = function(){
			self.activeTemplateName("listProductCategoriesTemplate");
		};
		this.productsListMenuItemClicked = function(){
			self.activeTemplateName("listProductsTemplate");
		};
		this.searchProductMenuItemClicked = function(){
			self.activeTemplateName("searchProductTemplate");
		};
		this.viewCartMenuItemClicked = function(){
			self.activeTemplateName("cartContentsTemplate");
		};
		this.checkoutMenuItemClicked = function(){
			self.cartViewModel.checkout();
			self.activeTemplateName("checkoutTemplate");
		};		
		
		
		
		this.listProductsInCategory = function(data){			
			self.productsViewModel.selectedProductCategory(data);
			self.activeTemplateName("listProductsInCategoryTemplate");
		};
		this.showProductDetails = function(data){
			self.productsViewModel.selectedProductID(data.id);
			self.activeTemplateName("showProductDetailsTemplate");
		};
		this.addToCart = function(data){
			console.log("Adding to cart: " + data); //TODO remove this
			self.cartViewModel.cartContent.push(data);
			console.log("Cart contents: " + self.cartViewModel.cartContent()); //TODO remove this
		};

	};
	
});