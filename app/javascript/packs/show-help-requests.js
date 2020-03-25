import { initGoogleMap, createMarker } from './google-map.js'

(() => {
  const lat = parseFloat(document.getElementById('help-request-lat').value)
  const lng = parseFloat(document.getElementById('help-request-lon').value)
  const position = {lat, lng}

  const map = initGoogleMap("google-map-container", position)
  const marker = createMarker(map, "something", position)
})()
