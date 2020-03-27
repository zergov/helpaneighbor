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

  async function fetchMarkers(position) {
    const requests = await $.ajax({
      url: "/help-requests.json",
      data: position,
    })

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
  }

  let pnorth, psouth, peast, pwest, pzoom;
  map.addListener('idle', () => {
    const center = map.getCenter()
    const zoom = map.getZoom()
    const position = {
      lat: center.lat(),
      lng: center.lng(),
    }

    // Only fetch markers if
    //    - the map just got initialized
    //    - the user moved out of the previous bounding box on his map
    //    - the user changed the zoom on the map
    const notInitialized = [pnorth, psouth, peast, pwest].some(c => c == null)
    const zoomChanged = zoom !== pzoom
    const outEast = position.lat > pwest && position.lat > peast
    const outWest = position.lat < pwest && position.lat < peast
    const outNorth = position.lng > pnorth && position.lng > psouth
    const outSouth = position.lng < pnorth && position.lng < psouth

    if (notInitialized || zoomChanged || outEast || outWest || outNorth || outSouth) {
      fetchMarkers(position)

      const bounds = map.getBounds()
      const ne = bounds.getNorthEast()
      const sw = bounds.getSouthWest()
      pnorth = ne.lng(); psouth = sw.lng()
      peast = ne.lat(); pwest = sw.lat()
      pzoom = zoom
    }
  })

  searchBox.addListener('places_changed', () => {
    var places = searchBox.getPlaces();

    if (places.length == 0) return;

    const place = places[0]
    const position = {
      lat: place.geometry.location.lat(),
      lng: place.geometry.location.lng(),
    }

    // clear existing markers and clear opened info window
    if (currentInfoWindow) currentInfoWindow.close()
    Object.values(requestsMarkers).forEach(({ marker }) => marker.setMap(null))
    requestsMarkers = {}

    fetchMarkers(position)
    updateMapBounds(map, place)
  })
})()
