"use strict";

function translate(type, value){
	if (locale[type]) {
		if(locale[type][value]){
			return locale[type][value]; 
		}
	}
	return value;
}

/** for changing the arrow in the collapse section. */    	  
jQuery('.collapse-header-with-chevron').click(function(){
	var has = jQuery(this)
	if(has.siblings().filter('.collapse').hasClass('show')) {
		jQuery(this).find('i').removeClass('fa-chevron-down');
		jQuery(this).find('i').addClass('fa-chevron-right');
	}
	else {
		jQuery(this).find('i').removeClass('fa-chevron-right');
		jQuery(this).find('i').addClass('fa-chevron-down');
	}
})