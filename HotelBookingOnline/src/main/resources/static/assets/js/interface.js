( function($) {



  'use strict';  



$(function(e) {







/*------------------------------------------------------------------



Menu Toggle Add Remove Class



-------------------------------------------------------------------*/	



	$(".navbar-toggler").click(function () {

		if($("body").hasClass('menu_overflow')){

			$("body").removeClass('menu_overflow');

			}else{

				$("body").addClass('menu_overflow');

				}		

	});

	

	

/*------------------------------------------------------------------



mCustomScrollbar



-------------------------------------------------------------------*/	



	(function($){



        $(window).on("load",function(){



            $(".content").mCustomScrollbar();



        });



    })($);







/*-------------------------------------------------------------------------------



		Advanced Serch Btn Toggle



	-------------------------------------------------------------------------------*/



 $('.Advanced_serch-btn').click(function(){



        $('.Advanced_serch_blog').slideToggle();



    });



	







/*-------------------------------------------------------------------------------



		Hotel Gird and List View



	-------------------------------------------------------------------------------*/



$(document).ready(function() {



    $('#list').click(function(event){event.preventDefault();$('#yemm_products .yemm_items').addClass('list-group-item');});



    $('#grid').click(function(event){event.preventDefault();$('#yemm_products .yemm_items').removeClass('list-group-item');$('#yemm_products .yemm_items').addClass('grid-group-item');});



});







/*------------------------------------------------------------------



Faq-Scroll



-------------------------------------------------------------------*/



jQuery(function($) {



	function fixDiv() {

	

		var $cache = $('#getFixed');

	

		if ($(window).scrollTop() > 600)

		

		$cache.css({

		

		'position': 'fixed',

		

		'top': '150px'

	

	});

	

	else

	

		$cache.css({

		

		'position': 'relative',

		

		'top': 'auto'

	

	});

	

	}

	

		$(window).scroll(fixDiv);

		

		fixDiv();



});



/*------------------------------------------------------------------



Hotel Description Scrollspy Smooth



-------------------------------------------------------------------*/







function scrollNav() {



  $('.scrollpay_nav a').click(function(){  



    //Toggle Class



    $(".active").removeClass("active");      



    $(this).closest('li').addClass("active");



    var theClass = $(this).attr("class");



    $('.'+theClass).parent('li').addClass('active');



    //Animate



    $('html, body').stop().animate({



        scrollTop: $( $(this).attr('href') ).offset().top - 160



    }, 400);



    return false;



  });



  $('.scrollTop a').scrollTop();



}



scrollNav();	



/*------------------------------------------------------------------



Feature Product Slider



-------------------------------------------------------------------*/



  $('#home_slider').flexslider({



    animation: "slide",

	

	controlNav: false,



  });



/*------------------------------------------------------------------



/*------------------------------------------------------------------



Feature Product Slider



-------------------------------------------------------------------*/



	$('#feature-products_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:2},



		800:{items:2},



		1000:{items:3}



	}



	})



/*------------------------------------------------------------------



Feature Product Slider 2



-------------------------------------------------------------------*/



	$('#feature-products_slider2 .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:2},



		800:{items:3},



		1000:{items:4}



	}



	})	







/*------------------------------------------------------------------



Feature Product Slider 3



-------------------------------------------------------------------*/



	$('#feature_products_slider3 .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:2},



		800:{items:3},



		1000:{items:5}



	}



	})	











/*------------------------------------------------------------------



Collection Slider 1



-------------------------------------------------------------------*/



	$('#Testimonial_slider1 .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	nav:false,



	dots:true,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:2000,



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})







/*------------------------------------------------------------------



Collection Slider 2



-------------------------------------------------------------------*/



	$('#collection_slider2 .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	nav:false,



	dots:true,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:3000,



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})





/*------------------------------------------------------------------



Recommended Destinations Carousel



-------------------------------------------------------------------*/



	$('#rec_dest_carousel .owl-carousel').owlCarousel({



	loop:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},

		

		575:{items:2},

		

		767:{items:3},



		1000:{items:4}



	}



	})

	

/*------------------------------------------------------------------



Popular Hotels Carousel



-------------------------------------------------------------------*/



$('#yemm-slider7').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    itemWidth: 280,



    itemMargin: 30,



    asNavFor: '#yemm-slider6'



  });



 



  $('#yemm-slider6').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    sync: "#yemm-slider7"



  })



/*------------------------------------------------------------------



Trending Product Slider 1



-------------------------------------------------------------------*/



	$('#trending_product_slider1 .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	dots:false,

	nav:true,

	

	autoplay:true,



	autoplayTimeout:4000,

	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})

	

/*------------------------------------------------------------------



Trending Product Slider 2



-------------------------------------------------------------------*/



	$('#trending_product_slider2 .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})



/*------------------------------------------------------------------



New Product Slider



-------------------------------------------------------------------*/



	$('#new-products_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:2},



		1000:{items:3}



	}



	})







/*------------------------------------------------------------------



New Testimonial 2 slider



-------------------------------------------------------------------*/



	$('#testimonial_2_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})



	



/*------------------------------------------------------------------



Popular Categories Slider



-------------------------------------------------------------------*/



	$('#popular_category .owl-carousel').owlCarousel({



	stagePadding:0,



	loop:true,



	margin:0,



	nav:true,



	dots:false,



	navText: ['<span class="back_cont">PREVIOUS</span>','<span class="next_cont">NEXT</span>'],



	autoplay:true,



	autoplayTimeout:5000,



	lazyLoad: true,



	responsive:{



		0:{



            items:1,



            stagePadding: 30



        },



        600:{



            items:1,



            stagePadding:50



        },



        1000:{



            items:1,



            stagePadding: 80



        },



        1200:{



            items:1,



            stagePadding: 130



        },



        1400:{



            items:1,



            stagePadding: 150



        },



        1600:{



            items:1,



            stagePadding: 200



        },



        1800:{



            items:1,



            stagePadding: 250



        }



	}



	})



/*------------------------------------------------------------------



facilities_slider



-------------------------------------------------------------------*/



	$('.facilities_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:0,



	nav:true,



	dots:false,



	navText:false,



	autoplay:false,



	autoplayTimeout:5000,



	responsive:{



		0:{items:2},



		576:{items:2},



		1000:{items:3}



	}



	})







/*------------------------------------------------------------------



facilities_slider2



-------------------------------------------------------------------*/



	$('.facilities_slider2 .owl-carousel').owlCarousel({



	loop:true,



	margin:0,



	nav:true,



	dots:false,



	navText:false,



	autoplay:false,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:2},



		1000:{items:4}



	}



	})



		



/*------------------------------------------------------------------



Similar Product Slider 



-------------------------------------------------------------------*/



	$('#similar_products_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:2},



		1000:{items:4}



	}



	})



	



	



/*------------------------------------------------------------------



Similar Product Slider 2



-------------------------------------------------------------------*/



	$('#similar_products_slider2 .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})







/*------------------------------------------------------------------



About Slider



-------------------------------------------------------------------*/



	$('#about_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:30,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:1},



		1000:{items:1}



	}



	})	



/*------------------------------------------------------------------



 Product Detail Slider 1



-------------------------------------------------------------------*/



  $('#detail_carousel1').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    itemWidth: 130,



    itemMargin: 5,



    asNavFor: '#detail_slider1'



  });



 



  $('#detail_slider1').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    sync: "#detail_carousel1"



  })



	



/*------------------------------------------------------------------



 Hotel Detail Slider 2



-------------------------------------------------------------------*/



  $('#detail_carousel2').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    itemWidth: 140,



    itemMargin: 30,



    asNavFor: '#detail_slider2'



  });



 



  $('#detail_slider2').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    sync: "#detail_carousel2"



  })











/*------------------------------------------------------------------



 Hotel Detail Slider 1



-------------------------------------------------------------------*/



  $('#detail_carousel3').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    itemWidth: 130,



    itemMargin: 5,



    asNavFor: '#detail_slider3'



  });



 



  $('#detail_slider3').flexslider({



    animation: "slide",



    controlNav: false,



    animationLoop: false,



    slideshow: false,



    sync: "#detail_carousel3"



  })



  



  



  /*------------------------------------------------------------------



Team Slider



-------------------------------------------------------------------*/



	$('#team_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:1},



		800:{items:2},



		1000:{items:3}



	}



	})



	



/*------------------------------------------------------------------



Client Slider



-------------------------------------------------------------------*/



	$('#client_slider .owl-carousel').owlCarousel({



	loop:true,



	margin:20,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



	autoplay:true,



	autoplayTimeout:5000,



	responsive:{



		0:{items:1},



		600:{items:1},



		800:{items:1},



		1000:{items:1}



	}



	})		



/*-------------------------------------------------------------------------------



	  Background slider



-------------------------------------------------------------------------------*/



	$('#slideshow .owl-carousel').owlCarousel({



    loop:true,



    margin:0,



	autoplay:true,



    autoplayTimeout:5000,



	nav:true,



	dots:false,



	navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>','<i class="fa fa-angle-right" aria-hidden="true"></i>'],



    responsive:{



        0:{items:1},



        1000:{items:1}



    }



	})















/*-------------------------------------------------------------------------------



	  Hotel List And Grid View



-------------------------------------------------------------------------------*/







$(document).ready(function() {



    $('#list').on('click',function(event) {



        event.preventDefault();



        $('#products .item').addClass('list-group-view');



		$('#list').addClass('active');



		$('#grid').removeClass('active');



    });



    $('#grid').on('click',function(event) {



        event.preventDefault();



        $('#products .item').removeClass('list-group-view');



        $('#products .item').addClass('grid-group-view');



		$('#grid').addClass('active');



		$('#list').removeClass('active');



    });



});























});







/*-------------------------------------------------------------------------------



	 Datepicker



-------------------------------------------------------------------------------*/



 var date_input=$('input[name="date"]'); //our date input has the name "date"



      var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";



      var options={



        format: 'mm/dd/yyyy',



        container: container,



        todayHighlight: true,



        autoclose: true,



      };



      date_input.datepicker(options);







/*-------------------------------------------------------------------------------



	 Scroll Top



-------------------------------------------------------------------------------*/



//Check to see if the window is top if not then display button



	$(window).scroll(function(){



		if ($(this).scrollTop() > 300) {



			$('#scrollToTop').fadeIn();



		} else {



			$('#scrollToTop').fadeOut();



		}



	});



	



	//Click event to scroll to top



	$('#scrollToTop').click(function(){



		$('html, body').animate({scrollTop : 0},1000);



		return false;



	});











/*-------------------------------------------------------------------------------



	 Sticky Header



-------------------------------------------------------------------------------*/



var stickyToggle = function(sticky, stickyWrapper, scrollElement) {



    var stickyHeight = sticky.outerHeight();



    var stickyTop = stickyWrapper.offset().top;



    if (scrollElement.scrollTop() >= stickyTop){



      stickyWrapper.height(stickyHeight);



      sticky.addClass("is-sticky");



    }



    else{



      sticky.removeClass("is-sticky");



      stickyWrapper.height('auto');



    }



  };



  



  // Find all data-toggle="sticky-onscroll" elements



  $('[data-toggle="sticky-onscroll"]').each(function() {



    var sticky = $(this);



    var stickyWrapper = $('<div>').addClass('sticky-wrapper'); // insert hidden element to maintain actual top offset on page



    sticky.before(stickyWrapper);



    sticky.addClass('sticky');



    



    // Scroll & resize events



    $(window).on('scroll.sticky-onscroll resize.sticky-onscroll', function() {



      stickyToggle(sticky, stickyWrapper, $(this));



    });



    



    // On page load



    stickyToggle(sticky, stickyWrapper, $(window));



  }); 



 



 /*-------------------------------------------------------------------------------



		Desboard-Nav -Toggle



	-------------------------------------------------------------------------------*/



	$('#nav_toggle').on('click', function(e) {



		   $(".ds_nav_main").toggleClass("nav-sidebar");



	});



	$('.cart_item_close').on('click', function(e) {



		   $(".ds_nav_main").removeClass("nav-sidebar");



	});



	



	$('#nav_toggle').on('click', function(e) {



		   $(".ds_nav_main").toggleClass("showcart");



	});



	$('.db_nav_close').on('click', function(e) {



		   $(".ds_nav_main").removeClass("showcart");



	});



/*-------------------------------------------------------------------------------



		Imageuploadify



	-------------------------------------------------------------------------------*/



	$('input[type="file"]').imageuploadify();



/*-------------------------------------------------------------------------------



		Discount-Slider



	-------------------------------------------------------------------------------*/



	$("#discunt_slider").slider({



			ticks: [0, 10, 20, 30, 40],



			ticks_labels: ['0%', '10%', '20%', '30%', '40%'],



			ticks_snap_bounds: 30



		});



/*-------------------------------------------------------------------------------



		Price rang slider



	-------------------------------------------------------------------------------*/			



	$("#ex2").slider({});

	$("#ex3").slider({});






})(jQuery);















