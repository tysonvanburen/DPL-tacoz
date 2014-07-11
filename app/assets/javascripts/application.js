//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require gmaps
//= require_tree .

$(function() {
  loadMap();
});

var loadMap = function() {
  var $map = $('#map');
  if($map.length) {
    var gmap = new GMaps({
      div: '#map',
      lat: $map.data('lat'),
      lng: $map.data('lon')
    });
    gmap.addMarker({
      lat: $map.data('lat'),
      lng: $map.data('lon'),
      title: 'Tacoz',
      infoWindow: {
        content: '<p>'+ $map.data('address') +'</p>'
      }
    });
  }

  var $fullMap = $('#full-map');
  if($fullMap.length) {
    $.getJSON('/locations.json', function(locations) {
      var defaultLocation = locations[0];
      var gmap = new GMaps({
        div: '#full-map',
        lat: defaultLocation.latitude,
        lng: defaultLocation.longitude
      });

      $(locations).each(function(index, location) {
        gmap.addMarker({
          lat: location.latitude,
          lng: location.longitude,
          title: 'Tacoz',
          infoWindow: {
            content: '<p>'+ location.address +'</p>'
          }
        });
      });
    });
  }



};
