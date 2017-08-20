/*
	Application specific magic 
*/

jQuery(function($)
{
	var docheight = $(document).height();
	var windowheight = $(window).height();
	
	//alert("window=" + windowheight + "doc height=" + docheight);
	
	if(docheight > windowheight)
		$("html, body").css("height", docheight);
	
});

