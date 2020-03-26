import { initGoogleMap } from './google-map.js'

(() => {
  const map = initGoogleMap("google-map-container")

  // Create the search box and link it to the UI element.
  const input = document.getElementById('address-input');
  const searchBox = new google.maps.places.SearchBox(input);

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

    if (place.geometry.viewport)
      bounds.union(place.geometry.viewport);
    else
      bounds.extend(position);

    map.fitBounds(bounds)
  })
})()
