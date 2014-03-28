/* 
 * The root view-model.
 */
$(function() {


	function RootViewModel() {
		var self = this;
		this.webShopViewModel = new window.WebShopViewModel();
		this.managementViewModel = new window.ManagementViewModel();
		
		this.activeTemplateName = ko.observable("webshopTemplate");//by default the webshop is displayed 
		
		//getter for this.activeTemplateName 
		this.getActiveTemplateName = function(){
			return self.activeTemplateName();
		};
		
		//do here all the necessary template post-processing
		this.templatePostProcessor = function(){
		};
		
		this.webShopMenuItemClicked = function(){
			console.log("webshop menu item clicked"); //TODO remove this
			self.activeTemplateName("webshopTemplate");
			
			$('#managementMenuItem').removeClass("active");
			$('#webShopMenuItem').addClass("active");
		};
		this.managementMenuItemClicked= function(){
			console.log("management menu item clicked"); //TODO remove this
			self.activeTemplateName("managementTemplate");
			$('#webShopMenuItem').removeClass("active");
			$('#managementMenuItem').addClass("active");

		};	

	};
	ko.applyBindings(new RootViewModel());
	
});
