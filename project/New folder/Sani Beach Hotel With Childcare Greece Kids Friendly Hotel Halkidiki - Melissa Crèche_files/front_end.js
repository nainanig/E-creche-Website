jQuery.noConflict();

jQuery(document).ready( function($) {
	// init all global front end features here
							
	//initCufon(); // initialize cufon text replacement - this is now done in front of the body closing tag
	
	initExternalLink();
	
	initNavGradients();
	
	// adds styling to sidebar listing for content pages
	zebraStripe('.sidebar_listing ul li:even');
	noborderLast('.sidebar_listing ul li:last');
	
	//newsletter popup event
	jQuery('.newsletter_popup').click( function() {
			tb_show('', this.href + '?isAjax=true&amp;TB_iframe=true&amp;height=590&amp;width=430', '');
			this.blur();
			stopSlideShow(); //stop header slideshow to improve performance
			return false;
		});
		
	 //send to friend popup event
   jQuery('.send-to-friend_popup').click( function() {
      		tb_show('', this.href + '?isAjax=true&amp;TB_iframe=true&amp;height=530&amp;width=370', '');
      		this.blur();
      		stopSlideShow(); //stop header slideshow to improve performance
      		return false;                      
    });
    
   //brochure popup event
   jQuery('.brochure_popup').click( function() {
          tb_show('', this.href + '?isAjax=true&amp;TB_iframe=true&amp;height=570&amp;width=370', '');
          this.blur();
          stopSlideShow(); //stop header slideshow to improve performance
          return false;                      
    });
   
   jQuery('#booking_button_hotel').click(function(){
		stopSlideShow();
		jQuery('#booking_form_hotel').animate({ opacity: 'toggle', height: 'toggle' }, "slow");
		jQuery('#booking_form_package').css({'display':'none'});
		return false;
	});
   
   jQuery('#booking_button_hotel').hover(
		function(){
			 $(this).addClass('rollover');
		},
		function(){
			$(this).removeClass('rollover');
		}
	);
		
	jQuery('#booking_button_package').click(function(){
    stopSlideShow();
    jQuery('#booking_form_package').animate({ opacity: 'toggle', height: 'toggle' }, "slow");
    jQuery('#booking_form_hotel').css({'display':'none'});
    return false;
  });
   
  jQuery('#booking_button_package').hover(
    function(){
       $(this).addClass('rollover');
    },
    function(){
      $(this).removeClass('rollover');
    }
  );
  
  jQuery('#booking_hotel_check_button').hover(
		function(){
			 $(this).addClass('rollover');
		},
		function(){
			$(this).removeClass('rollover');
	});

  jQuery('#booking_package_check_button').hover(
    function(){
       $(this).addClass('rollover');
    },
    function(){
      $(this).removeClass('rollover');
  });
   
  jQuery('#booking_package_check_button').click(function(){
		jQuery('#booking_form_package').css({'display':'block'});
	});
	
	jQuery('#booking_hotel_check_button').click(function(){
    jQuery('#booking_form_hotel').css({'display':'block'});
  });

  //jQuery('#booking_hotel form').submit(function()
		  //{
	  		//pageTracker._linkByPost(this);
			//return _gaq.push(['_trackEvent', 'hotels-check-availability-button', 'click', 'button']);
	  		//return pageTracker._trackEvent('hotels-check-availability-button', 'click', 'button');
	  		
		  //});
		  
  jQuery('#booking_package form').submit(function()
		  {
			pageTracker._linkByPost(this);
			pageTracker._trackEvent('packages-check-availability-button', 'click', 'button');
			var checkIn = new Date(jQuery('#package_booking_datein_year').val(), jQuery('#package_booking_datein_month').val(), jQuery('#package_booking_datein_day').val());
			var checkInDay = checkIn.getDate() + '';
			var checkInMonth = checkIn.getMonth() + '';
			var checkOut = new Date(jQuery('#package_booking_dateout_year').val(), jQuery('#package_booking_dateout_month').val(), jQuery('#package_booking_dateout_day').val());
			var package_details = {
				Hotel: jQuery('#package_booking_Hotel').val(),
				Airport: jQuery('#package_booking_Airport').val(),
				Date: (1 == checkInDay.length ? '0'+ checkInDay : checkInDay) +'/'+ (1 == checkInMonth.length ? '0'+ checkInMonth : checkInMonth) +'/'+ checkIn.getFullYear(), // dd/mm/yyyy
				Nights: (checkOut.getTime() - checkIn.getTime()) / 86400000, // milliseconds, not seconds
				Rooms: jQuery('#package_booking_Rooms').val()
			};
			return !window.open('http://sanibookings.vhibridge.com/?'+ jQuery.param(package_details), 'Welcome', 'width=970,height=700,menubar=no,status=no,location=no,toolbar=no,scrollbars=yes');
		  });
  
  
});

function initCufon() {			
	Cufon.replace('.cufon_helvetica_neue', { fontFamily: 'HelveticaNeue', hover: true, hoverables: { a: true } });
	Cufon.replace('body h1', { fontFamily: 'HelveticaNeue' });
	Cufon.replace('body h2', { fontFamily: 'HelveticaNeue' });
	Cufon.replace('body h3', { fontFamily: 'HelveticaNeue' });
	Cufon.now(); // IE flicker fix
}

function initExternalLink() {
	jQuery("a[rel='external']").attr({'target': '_blank'});
	jQuery(".external").attr({'target': '_blank'});
}

function initNavGradients() {
	jQuery(".header .topnav a").prepend("<span class='gradient'>&nbsp;</span>");
}

function zebraStripe(target){
	jQuery(target).addClass('odd');
}

function noborderLast(target){
	jQuery(target).addClass('noborder');
}

function stopSlideShow() {
	jQuery("div.carousel_images > ul", '.slideshow').cycle('pause');
}

function startSlideShow() {
	jQuery("div.carousel_images > ul", '.slideshow').cycle('resume');
}

function calendarBHSelect(date)
{
	wfd_hotel_booking_chInD_update_linked(date);
	adjustBHToDate();
}

function adjustBHToDate(){
	
	var fromDay = jQuery('#hotel_booking_chInD_day').val();
	var fromMonth = jQuery('#hotel_booking_chInD_month').val();
	var fromYear = jQuery('#hotel_booking_chInD_year').val();
	
	var fromDate = new Date(fromYear, fromMonth-1, fromDay);
	
	var toDay = jQuery('#hotel_booking_chOuD_day').val();
	var toMonth = jQuery('#hotel_booking_chOuD_month').val();
	var toYear = jQuery('#hotel_booking_chOuD_year').val();
	
	var toDate = new Date(toYear, toMonth-1, toDay);

	if( toDate.getTime() < (fromDate.getTime()+(1000*60*60*24)) ){
		
		var setToDate = new Date(fromDate.getTime()+(1000*60*60*24));

		setToDay = setToDate.getDate();
		if(setToDay.toString().length == 1)
		{
			setToDay = "0"+setToDay.toString();
		}
		jQuery('#hotel_booking_chOuD_day').val(setToDay);

		setToMonth = setToDate.getMonth()+1;

		if(setToMonth.toString().length == 1)
		{
			setToMonth = "0"+setToMonth.toString();
		}

		jQuery('#hotel_booking_chOuD_month').val(setToMonth);

		jQuery('#hotel_booking_chOuD_year').val(setToDate.getFullYear());

	}
	
}



function calendarBPSelect(date)
{
	wfd_package_booking_datein_update_linked(date);
	adjustBPToDate();
}

function adjustBPToDate(){
	
	var fromDay = jQuery('#package_booking_datein_day').val();
	var fromMonth = jQuery('#package_booking_datein_month').val();
	var fromYear = jQuery('#package_booking_datein_year').val();
	
	var fromDate = new Date(fromYear, fromMonth-1, fromDay);
	
	var toDay = jQuery('#package_booking_dateout_day').val();
	var toMonth = jQuery('#package_booking_dateout_month').val();
	var toYear = jQuery('#package_booking_dateout_year').val();
	
	var toDate = new Date(toYear, toMonth-1, toDay);

	if( toDate.getTime() < (fromDate.getTime()+(1000*60*60*24)) ){
		
		var setToDate = new Date(fromDate.getTime()+(1000*60*60*24));

		setToDay = setToDate.getDate();
		if(setToDay.toString().length == 1)
		{
			setToDay = "0"+setToDay.toString();
		}
		jQuery('#package_booking_dateout_day').val(setToDay);

		setToMonth = setToDate.getMonth()+1;

		if(setToMonth.toString().length == 1)
		{
			setToMonth = "0"+setToMonth.toString();
		}

		jQuery('#package_booking_dateout_month').val(setToMonth);

		jQuery('#package_booking_dateout_year').val(setToDate.getFullYear());

	}
	
}
