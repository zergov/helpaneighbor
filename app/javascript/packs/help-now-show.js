import { initGoogleMap, createHelpRequestMarker, updateMapBounds } from './google-map.js'

function infoWindowForRequest(request) {
  return `
  <h2 class="capitalize">${request.name}</h2>
  <p class="white-spaces">${request.description}</p>
  <a href="/help-requests/${request.id}">help this person</a>
  `
}

(async () => {
  const map = initGoogleMap("google-map-container")

  // Create the search box and link it to the UI element.
  const input = document.getElementById('address-input');
  const searchBox = new google.maps.places.SearchBox(input);

  let requestsMarkers = {}
  let currentInfoWindow;

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
    Object.values(requestsMarkers).forEach(({ marker, infoWindow }) => {
      marker.setMap(null)
      infoWindow.close()
    })
    requestsMarkers = {}

    requests.forEach(request => {
      const position = {
        lat: parseFloat(request.address_lat),
        lng: parseFloat(request.address_lon)
      }

      if (!requestsMarkers[request.id]) {
        const marker = createHelpRequestMarker(map, request.name, position)
        const infoWindow = new google.maps.InfoWindow({ content: infoWindowForRequest(request) });

        marker.addListener('click', () => {
          if (currentInfoWindow) currentInfoWindow.close()
          infoWindow.open(map, marker)
          currentInfoWindow = infoWindow;
        })

        requestsMarkers[request.id] = {
          request,
          marker,
          infoWindow,
        }
      }
    })
  })
})()
