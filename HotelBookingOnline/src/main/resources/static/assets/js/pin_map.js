   //var myMap;
   // var myLatlng = new google.maps.LatLng(52.518903284520796,-1.450427753967233);
   
    function initialize() {
        var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };            
    // Display a map on the web page
    map = new google.maps.Map(document.getElementById("map"), mapOptions);
    map.setTilt(50);
        
    // Multiple markers location, latitude, and longitude
    var markers = [
	  
        ['2950 MINERS AVE' , 52.177113, -106.656519],
		['Australia' , -31.955511, 115.860494],
		['Goa' , 15.536331, 73.764494],
		['Bangkok' , 13.745248, 100.558618],
		['Malaysia' , 3.166426, 101.692419],
		['Dubai' , 25.256669, 55.298248],
    ];                   
    // Info window content
    var infoWindowContent = [
        ['<div class="most_pop_item_blog map-info-box">' +
  '<div class="item_img_blog">' +
  '<img src="assets/images/most_popular_item3.jpg" class="img-fluid" alt="">' +
  '</div>' +
  '<div class="pop_item_description">' +
  '<div class="yemm_hotel_location clearfix">' +
   '<h5>' +
   '<a href="hotel-detail-1.html">Grace Building, Sydney</a>' +
   '</h5>' +
    '<strong class="float-left">' +
	'<i class="fa fa-map-marker m-r-7"></i>' +
	'Orlando Gonzales, Cuba </strong>' +
     '<p class="float-right"><span class="outline_bages m-r-7">Ad</span> <i class="fa fa-check-circle"></i></p><div class="clearfix"></div><hr class="item_divder"><p class="float-left text-center"> <strong class="green_text">$55.8</strong> <span class="text-uppercase d-block">PER NIGHT</span></p><a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a> </div></div></div>'],
	 ['<div class="most_pop_item_blog map-info-box">' +
  '<div class="item_img_blog">' +
  '<img src="assets/images/most_popular_item5.jpg" class="img-fluid" alt="">' +
  '</div>' +
  '<div class="pop_item_description">' +
  '<div class="yemm_hotel_location clearfix">' +
   '<h5>' +
   '<a href="hotel-detail-1.html">COMO The Treasury</a>' +
   '</h5>' +
    '<strong class="float-left">' +
	'<i class="fa fa-map-marker m-r-7"></i>' +
	'Orlando Gonzales, Cuba </strong>' +
     '<p class="float-right"><span class="outline_bages m-r-7">Ad</span> <i class="fa fa-check-circle"></i></p><div class="clearfix"></div><hr class="item_divder"><p class="float-left text-center"> <strong class="green_text">$55.8</strong> <span class="text-uppercase d-block">PER NIGHT</span></p><a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a> </div></div></div>'],
	 ['<div class="most_pop_item_blog map-info-box">' +
  '<div class="item_img_blog">' +
  '<img src="assets/images/most_popular_item5.jpg" class="img-fluid" alt="">' +
  '</div>' +
  '<div class="pop_item_description">' +
  '<div class="yemm_hotel_location clearfix">' +
   '<h5>' +
   '<a href="hotel-detail-1.html">Resort Terra Paraiso </a>' +
   '</h5>' +
    '<strong class="float-left">' +
	'<i class="fa fa-map-marker m-r-7"></i>' +
	'Orlando Gonzales, Cuba </strong>' +
     '<p class="float-right"><span class="outline_bages m-r-7">Ad</span> <i class="fa fa-check-circle"></i></p><div class="clearfix"></div><hr class="item_divder"><p class="float-left text-center"> <strong class="green_text">$55.8</strong> <span class="text-uppercase d-block">PER NIGHT</span></p><a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a> </div></div></div>'],
	 ['<div class="most_pop_item_blog map-info-box">' +
  '<div class="item_img_blog">' +
  '<img src="assets/images/most_popular_item5.jpg" class="img-fluid" alt="">' +
  '</div>' +
  '<div class="pop_item_description">' +
  '<div class="yemm_hotel_location clearfix">' +
   '<h5>' +
   '<a href="hotel-detail-1.html">Hotel Manhattan</a>' +
   '</h5>' +
    '<strong class="float-left">' +
	'<i class="fa fa-map-marker m-r-7"></i>' +
	'Bangkok </strong>' +
     '<p class="float-right"><span class="outline_bages m-r-7">Ad</span> <i class="fa fa-check-circle"></i></p><div class="clearfix"></div><hr class="item_divder"><p class="float-left text-center"> <strong class="green_text">$55.8</strong> <span class="text-uppercase d-block">PER NIGHT</span></p><a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a> </div></div></div>'],
   ['<div class="most_pop_item_blog map-info-box">' +
  '<div class="item_img_blog">' +
  '<img src="assets/images/most_popular_item5.jpg" class="img-fluid" alt="">' +
  '</div>' +
  '<div class="pop_item_description">' +
  '<div class="yemm_hotel_location clearfix">' +
   '<h5>' +
   '<a href="hotel-detail-1.html">Sunway Putra Hotel</a>' +
   '</h5>' +
    '<strong class="float-left">' +
	'<i class="fa fa-map-marker m-r-7"></i>' +
	'100 Jalan Putra, 50350, Kuala Lumpur, Malaysia </strong>' +
     '<p class="float-right"><span class="outline_bages m-r-7">Ad</span> <i class="fa fa-check-circle"></i></p><div class="clearfix"></div><hr class="item_divder"><p class="float-left text-center"> <strong class="green_text">$55.8</strong> <span class="text-uppercase d-block">PER NIGHT</span></p><a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a> </div></div></div>'],
	 ['<div class="most_pop_item_blog map-info-box">' +
  '<div class="item_img_blog">' +
  '<img src="assets/images/most_popular_item5.jpg" class="img-fluid" alt="">' +
  '</div>' +
  '<div class="pop_item_description">' +
  '<div class="yemm_hotel_location clearfix">' +
   '<h5>' +
   '<a href="hotel-detail-1.html">Orchid Vue Hotel</a>' +
   '</h5>' +
    '<strong class="float-left">' +
	'<i class="fa fa-map-marker m-r-7"></i>' +
	'Behind Adcb Bank, Street No. 1A, Khalid Bin Al Waleed Road, Bur Dubai, Dubai, 185170, UAE </strong>' +
     '<p class="float-right"><span class="outline_bages m-r-7">Ad</span> <i class="fa fa-check-circle"></i></p><div class="clearfix"></div><hr class="item_divder"><p class="float-left text-center"> <strong class="green_text">$55.8</strong> <span class="text-uppercase d-block">PER NIGHT</span></p><a href="hotel-detail-1.html" class="btn btn-success float-right">Book Now</a> </div></div></div>'],
    ];
        
    // Add multiple markers to map
    var infoWindow = new google.maps.InfoWindow(), marker, i;
    
    // Place each marker on the map  
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0],
			icon:src="assets/images/map-pin-icon.png"
        });
        
        // Add info window to marker    
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Center the map to fit all markers on the screen
        map.fitBounds(bounds);
    }

    // Set zoom level
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(5);
        google.maps.event.removeListener(boundsListener);
    });
    }
    google.maps.event.addDomListener(window, 'load', initialize);