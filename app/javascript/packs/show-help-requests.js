import { initGoogleMap, createHelpRequestMarker } from './google-map.js'

(() => {
  const lat = parseFloat(document.getElementById('help-request-lat').value)
  const lng = parseFloat(document.getElementById('help-request-lon').value)
  const position = {lat, lng}

  const map = initGoogleMap("google-map-container", position)
  map.setZoom(19)
  const marker = createHelpRequestMarker(map, "something", position)
})()
