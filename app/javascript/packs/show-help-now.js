import { initGoogleMap, createMarker, updateMapBounds } from './google-map.js'

(async () => {
  const map = initGoogleMap("google-map-container")

  // Create the search box and link it to the UI element.
  const input = document.getElementById('address-input');
  const searchBox = new google.maps.places.SearchBox(input);

  let requestsMarkers = {}

  searchBox.addListener('places_changed', async () => {
    var places = searchBox.getPlaces();

    if (places.length == 0) return;

    const place = places[0]
    updateMapBounds(map, place)

    const requests = await $.ajax({
      url: "/help-requests.json",
      data: {
        lat: place.geometry.location.lat(),
        lng: place.geometry.location.lng(),
      },
    })

    // clear existing markers
    Object.values(requestsMarkers).forEach(({ marker }) => marker.setMap(null))
    requestsMarkers = {}

    requests.forEach(request => {
      const requestPosition = {
        lat: parseFloat(request.address_lat),
        lng: parseFloat(request.address_lon)
      }

      if (!requestsMarkers[request.id]) {
        requestsMarkers[request.id] = {
          request,
          marker: createMarker(map, request.name, requestPosition)
        }
      }
    })
  })
})()
