import { initGoogleMap } from './google-map.js'

function setAddressCoords(lat, lng) {
  document.getElementById('address-input-lat').value = lat
  document.getElementById('address-input-lng').value = lng
}

function createMarker(map, place) {
  const icon = {
    url: place.icon,
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(25, 25)
  };

  return new google.maps.Marker({
    map: map,
    icon: icon,
    title: place.name,
    position: place.geometry.location
  });
}

document.addEventListener("DOMContentLoaded", () => {
  const map = initGoogleMap("google-map-container", )

  // Create the search box and link it to the UI element.
  const input = document.getElementById('address-input');
  const searchBox = new google.maps.places.SearchBox(input);

  let marker;

  searchBox.addListener('places_changed', () => {
    var places = searchBox.getPlaces();

    if (places.length == 0)
      return;

    const bounds = new google.maps.LatLngBounds()
    const place = places[0]

    setAddressCoords(place.geometry.location.lat(), place.geometry.location.lng())

    if (marker) marker.setMap(null)
    marker = createMarker(map, place)

    if (place.geometry.viewport)
      bounds.union(place.geometry.viewport);
    else
      bounds.extend(place.geometry.location);

    map.fitBounds(bounds)
  })
});
