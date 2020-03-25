import { initGoogleMap, createMarker } from './google-map.js'

function setAddressCoords({lat, lng}) {
  document.getElementById('address-input-lat').value = lat
  document.getElementById('address-input-lng').value = lng
}

(() => {
  const map = initGoogleMap("google-map-container", )

  // Create the search box and link it to the UI element.
  const input = document.getElementById('address-input');
  const searchBox = new google.maps.places.SearchBox(input);

  // marker on the map
  let marker;

  searchBox.addListener('places_changed', () => {
    var places = searchBox.getPlaces();

    if (places.length == 0)
      return;

    const bounds = new google.maps.LatLngBounds()
    const place = places[0]
    const position = {
      lat: place.geometry.location.lat(),
      lng: place.geometry.location.lng(),
    }

    setAddressCoords(position)

    // remove existing markers
    if (marker) marker.setMap(null)

    marker = createMarker(map, place.name, position)

    if (place.geometry.viewport)
      bounds.union(place.geometry.viewport);
    else
      bounds.extend(position);

    map.fitBounds(bounds)
  })
})();
