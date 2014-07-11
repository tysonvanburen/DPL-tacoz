//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require gmaps
//= require_tree .

$(function() {
  loadMap();
});

var loadMap = function() {
  $map = $('#map');
  if($map.length) {
    var gmap = new GMaps({
      div: '#map',
      lat: $map.data('lat'),
      lng: $map.data('lon')
    });
  }
};
