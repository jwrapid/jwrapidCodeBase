/* 
 * The management subsystem's view-model.
 */
$(function() {
	window.ManagementViewModel = function ManagementViewModel(){
			var self = this;
			
			this.activeTemplateName=ko.observable("customerStatisticsTemplate"); //customer statistics is active by default
			
			this.customerStatisticsMenuItemClicked = function(){
				console.log("customerStatistics menu item clicked"); //TODO remove this
				
				$('#productStatisticsMenuItem').removeClass("active");
				$('#storeStatisticsMenuItem').removeClass("active");
				$('#customerStatisticsMenuItem').addClass("active");
				self.activeTemplateName("customerStatisticsTemplate");
			};
			this.productStatisticsMenuItemClicked = function(){
				console.log("productStatistics menu item clicked"); //TODO remove this
				
				$('#productStatisticsMenuItem').addClass("active");
				$('#storeStatisticsMenuItem').removeClass("active");
				$('#customerStatisticsMenuItem').removeClass("active");
				self.activeTemplateName("productStatisticsTemplate");
			};
			this.storeStatisticsMenuItemClicked = function(){
				console.log("storeStatistics menu item clicked"); //TODO remove this
	
				$('#productStatisticsMenuItem').removeClass("active");
				$('#storeStatisticsMenuItem').addClass("active");
				$('#customerStatisticsMenuItem').removeClass("active");
				self.activeTemplateName("storeStatisticsTemplate");
			};
	
		
		
		//formats the price
		this.getFormattedPrice = function(price){
			return "$"+price;
		};
		
		//dummy data - should be generated server-side and queried via AJAX
		this.customerStatistics = ko.observableArray([
		   {customerID: 1, customerName:"customer1", totalPurchaseCount: 10, totalPurchasePrice: 100},
		   {customerID: 2, customerName:"customer2", totalPurchaseCount: 20, totalPurchasePrice: 200},
		   {customerID: 3, customerName:"customer3", totalPurchaseCount: 30, totalPurchasePrice: 300},
		   {customerID: 4, customerName:"customer4", totalPurchaseCount: 40, totalPurchasePrice: 400},
		   {customerID: 5, customerName:"customer5", totalPurchaseCount: 50, totalPurchasePrice: 500}
		]);
		
		//dummy data - should be generated server-side and queried via AJAX
		this.productStatistics = ko.observableArray([
		   {productCode: 1, productName:"product1", totalSoldCount: 10, totalSoldPrice: 100},
		   {productCode: 2, productName:"product2", totalSoldCount: 20, totalSoldPrice: 200},
		   {productCode: 3, productName:"product3", totalSoldCount: 30, totalSoldPrice: 300},
		   {productCode: 4, productName:"product4", totalSoldCount: 40, totalSoldPrice: 400},
		   {productCode: 5, productName:"product5", totalSoldCount: 50, totalSoldPrice: 500}	                                            
	  	]);
		
		//dummy data - should be generated server-side and queried via AJAX
		this.storeStatistics = ko.observableArray([
	   	   {storeID: 1, storeName:"store1", totalOrderCount: 10, totalOrderPrice: 100},
		   {storeID: 2, storeName:"store2", totalOrderCount: 20, totalOrderPrice: 200},
		   {storeID: 3, storeName:"store3", totalOrderCount: 30, totalOrderPrice: 300},
		   {storeID: 4, storeName:"store4", totalOrderCount: 40, totalOrderPrice: 400},
		   {storeID: 5, storeName:"store5", totalOrderCount: 50, totalOrderPrice: 500}	                                          
	   	]);
	};//end of view-model
});