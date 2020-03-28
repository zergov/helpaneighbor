import { initGoogleMap, createLocationMarker, updateMapBounds } from './google-map.js'

function setAddressCoords({lat, lng}) {
  document.getElementById('address-input-lat').value = lat
  document.getElementById('address-input-lng').value = lng
}

function getRequestPosition() {
  const lat = document.getElementById('address-input-lat').value
  const lng = document.getElementById('address-input-lng').value

  if (lat && lng) {
    return {
      lat: parseFloat(document.getElementById('address-input-lat').value),
      lng: parseFloat(document.getElementById('address-input-lng').value),
    }
  }
}

(() => {
  const requestPosition = getRequestPosition();
  const map = initGoogleMap("google-map-container", requestPosition)

  // Create the search box and link it to the UI element.
  const input = document.getElementById('help_request_address');
  const searchBox = new google.maps.places.SearchBox(input);

  // marker on the map
  let marker;

  if (requestPosition) {
    const address = document.getElementById('help_request_address').value
    marker = createLocationMarker(map, address, requestPosition)
  }

  searchBox.addListener('places_changed', () => {
    var places = searchBox.getPlaces();

    if (places.length == 0) return;

    const place = places[0]
    const position = {
      lat: place.geometry.location.lat(),
      lng: place.geometry.location.lng(),
    }

    setAddressCoords(position)

    // remove existing markers
    if (marker) marker.setMap(null)

    marker = createLocationMarker(map, place.name, position)

    updateMapBounds(map, place)

    map.setZoom(18)
  })
})();
