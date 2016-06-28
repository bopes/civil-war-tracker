
(function initMap() {
  var myLatLng = {lat: <%= @latitude %>, lng: <%= @longitude %>};
  // Create a map object and specify the DOM element for display.
  var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.6795, lng: -84.4038},
    scrollwheel: false,
    zoom: 5
  });

  var marker = new google.maps.Marker({
    map: map,
    position: myLatLng
    // title: <%= @battleName %>
  });

})