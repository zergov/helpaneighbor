import MapIcons from "./map-icon/map-icons.js"

const defaultPosition = {lat: 45.4945877, lng: -73.5622815}

export function initGoogleMap(container, center = defaultPosition) {
  return new google.maps.Map(document.getElementById(container), {
    center,
    zoom: 15,
    mapTypeId: 'roadmap'
  });
}

export function createLocationMarker(map, title, position) {
  return new MapIcons.Marker({
    map,
    icon: {
      path: MapIcons.shapes.MAP_PIN,
      fillColor: '#e74c3c',
      fillOpacity: 1,
      strokeColor: '#000000',
      strokeWeight: 1,
    },
    title,
    position,
	  map_icon_label: '',
  });
}

export function createHelpRequestMarker(map, title, position) {
  return new MapIcons.Marker({
    map,
    icon: {
      path: MapIcons.shapes.SQUARE_ROUNDED,
      fillColor: '#e74c3c',
      fillOpacity: 1,
      strokeColor: '#000000',
      strokeWeight: 1,
    },
    title,
    position,
	  map_icon_label: '<span class="map-icon map-icon-wheelchair"></span>',
  });
}

export function updateMapBounds(map, place) {
  const bounds = new google.maps.LatLngBounds()
  if (place.geometry.viewport)
    bounds.union(place.geometry.viewport);
  else
    bounds.extend(position);

  map.fitBounds(bounds)
}

