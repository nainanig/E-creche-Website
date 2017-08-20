if(jQuery.browser.msie && parseInt(jQuery.browser.version, 10) == 6) {
  try {
    document.execCommand("BackgroundImageCache", false, true);
  } catch(err) {}
}


$slideshow = {
    context: true,
    tabs: false,
    timeout: 5000,      // time before next slide appears (in ms)
    slideSpeed: 3000,   // time it takes to slide in each slide (in ms)
    tabSpeed: 3000,      // time it takes to slide in each slide (in ms) when clicking through tabs
    fx: 'fade',   // the slide effect to use (blindX, blindY, blindZ, cover, curtainX, curtainY, fade, fadeZoom, growX, growY, scrollUp, scrollDown, scrollLeft, scrollRight, scrollHorz,scrollVert,shuffle, slideX, slideY, toss, turnUp, turnDown, turnLeft, turnRight, uncover, wipe, zoom) http://malsup.com/jquery/cycle/browser.html http://malsup.com/jquery/cycle/

    
    init: function($, context) {
        // set the context to help speed up selectors/improve performance
        this.context = $(context);
        
        // set tabs to current hard coded navigation items
        this.tabs = $('ul.carousel_nav li', this.context);
        
        // remove hard coded navigation items from DOM 
        // because they aren't hooked up to jQuery cycle
        this.tabs.remove();
        
        // prepare slideshow and jQuery cycle tabs
        this.prepareSlideshow($);
    },
    
    prepareSlideshow: function($) {
        // initialise the jquery cycle plugin -
        // for information on the options set below go to: 
        // http://malsup.com/jquery/cycle/options.html
        $("div.carousel_images > ul", $slideshow.context).cycle({
            fx: $slideshow.fx,
            timeout: $slideshow.timeout,
            speed: $slideshow.slideSpeed,
            fastOnEvent: $slideshow.tabSpeed,
            pager: $("ul.carousel_nav", $slideshow.context),
            pagerAnchorBuilder: $slideshow.prepareTabs,
            before: $slideshow.activateTab,
            pauseOnPagerHover: false,
            pause: false
        });            
    },
    
    prepareTabs: function(i, slide) {
        // return markup from hardcoded tabs for use as jQuery cycle tabs
        // (attaches necessary jQuery cycle events to tabs)
        return $slideshow.tabs.eq(i);
    },

    activateTab: function(currentSlide, nextSlide) {
        // get the active tab
        var activeTab = jQuery('a[href="#' + nextSlide.id + '"]', $slideshow.context);
        
        // if there is an active tab
        if(activeTab.length) {
            // remove active styling from all other tabs
            $slideshow.tabs.removeClass('active');
            
            // add active styling to active button
            activeTab.parent().addClass('active');
        }            
    }            
};


jQuery(document).ready( function($) {
	// add a 'js' class to the body  
	$('body').addClass('js');  	   
    // initialise the slideshow when the DOM is ready
	$slideshow.init($, '.slideshow');
	// stop slideshow
	//$("div.carousel_images > ul", '.slideshow').cycle('stop');
	
});
