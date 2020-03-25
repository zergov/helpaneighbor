export function initGoogleMap(container, lat = 45.4945877, lng = -73.5622815) {
  return new google.maps.Map(document.getElementById(container), {
    center: {lat, lng},
    zoom: 15,
    mapTypeId: 'roadmap'
  });
}
