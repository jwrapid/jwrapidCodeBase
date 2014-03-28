/*
 * The webshop's products-related sub view-model.
 */
$(function(){
	window.ProductsViewModel = function ProductsViewModel(){
		
		this.selectedProductCategory = ko.observable(""); //holds the currently selected product category
		this.selectedProductID = ko.observable(0); //holds the currently selected product's ID
		
		var self = this;
		
		
		
		//dummy data - should be generated server-side and queried via AJAX 
		this.productCategories = ko.observableArray([
		    "productCategory1",
		    "productCategory2",
		    "productCategory3",
		    "productCategory4",
		    "productCategory5",
		    "productCategory6",
		    "productCategory7"
		]);

		//dummy data - should be generated server-side and queried via AJAX		
		this.products = ko.observableArray([
		    {code:1,name:"product1", category: "productCategory1", description:"description1", image: "dummy_img.jpg",price:1, weight: 5, dimensions:"100*100mm", numberAvailableInStock: 10}, 
		    {code:2,name:"product2", category: "productCategory1", description:"description2", image: "dummy_img.jpg",price:2, weight: 15, dimensions:"200*200mm", numberAvailableInStock: 9},
		    {code:3,name:"product3", category: "productCategory1", description:"description3", image: "dummy_img.jpg",price:3, weight: 25, dimensions:"300*300mm", numberAvailableInStock: 8},
		    {code:4,name:"product4", category: "productCategory2", description:"description4", image: "dummy_img.jpg",price:4, weight: 35, dimensions:"400*400mm", numberAvailableInStock: 7},
		    {code:5,name:"product5", category: "productCategory2", description:"description5", image: "dummy_img.jpg",price:5, weight: 45, dimensions:"500*500mm", numberAvailableInStock: 6},
		    {code:6,name:"product6", category: "productCategory3", description:"description6", image: "dummy_img.jpg",price:6, weight: 55, dimensions:"600*600mm", numberAvailableInStock: 5},
		    {code:7,name:"product7", category: "productCategory3", description:"description7", image: "dummy_img.jpg",price:7, weight: 65, dimensions:"700*700mm", numberAvailableInStock: 4},
		    {code:8,name:"product8", category: "productCategory4", description:"description8", image: "dummy_img.jpg",price:8, weight: 75, dimensions:"800*800mm", numberAvailableInStock: 3}
		]);
		
		//dummy data - should be generated server-side and queried via AJAX
		this.product = ko.computed(function(){
			var resultObj = {};
			ko.utils.arrayForEach(self.products(), function(product) {
		        if (product.id == self.selectedProductID())
		        {
		        	resultObj = product;
		        }
		    });
			return resultObj;
			
		}, this);

		
		//dummy data - should be generated server-side and queried via AJAX		
		this.productsPerCategory = ko.computed(function(){
			if (self.selectedProductCategory() == "productCategory1")
			{
				return [self.products()[0], 
						self.products()[1],
						self.products()[2]
				        ];
			}
			else if (self.selectedProductCategory() == "productCategory2")
			{
				return[self.products()[3],
				       self.products()[4]
				       ];
			}
			else if (self.selectedProductCategory() == "productCategory3")
			{
				return[	self.products()[5],
						self.products()[6]
				       ];
			}
			else if (self.selectedProductCategory() == "productCategory4")
			{
				return[
				       	self.products()[7]
				       ];
			}	
			else
			{
				return [];
			}
			
		}, this);

		//formats the price
		this.getFormattedPrice = function(price){
			return "$"+price;
		};
		//formats the weight
		this.getFormattedWeight = function(weight){
			return weight+" kg";
		};		
		

	};
});