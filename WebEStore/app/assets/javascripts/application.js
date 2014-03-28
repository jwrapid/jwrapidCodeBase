// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require_tree .

$(document).ready(function(){
 
        $("#purchased").show();
        $("#most-ordered").hide();
        $("#most-looked").hide();
        $("#most-sold").hide();
        $("#most-voted").hide();
 
	    $('#purchased-btn').click(function(){
	    	$("#most-voted").hide();
	    	$("#most-ordered").hide();
	        $("#most-looked").hide();
	        $("#most-sold").hide();
	    	$("#purchased").slideToggle();
    	});
    	 $('#most-ordered-btn').click(function(){
    	 	$("#most-voted").hide();
    	 	$("#purchased").hide();
	        $("#most-looked").hide();
	        $("#most-sold").hide();
	    	$("#most-ordered").slideToggle();
    	});
    	  $('#most-looked-btn').click(function(){
    	  	$("#most-voted").hide();
    	  	$("#purchased").hide();
	        $("#most-ordered").hide();
	        $("#most-sold").hide();
	    	$("#most-looked").slideToggle();
    	});
    	   $('#most-sold-btn').click(function(){
    	   	$("#most-voted").hide();
    	   	$("#purchased").hide();
	        $("#most-ordered").hide();
	        $("#most-looked").hide();
	    	$("#most-sold").slideToggle();
    	});

    	   $('#most-voted-btn').click(function(){
    	   	$("#purchased").hide();
	        $("#most-ordered").hide();
	        $("#most-looked").hide();
	        $("#most-sold").hide();
	    	$("#most-voted").slideToggle();
    	});
 
});
