const defaultPosition = {lat: 45.4945877, lng: -73.5622815}

export function initGoogleMap(container, center = defaultPosition) {
  return new google.maps.Map(document.getElementById(container), {
    center,
    zoom: 15,
    mapTypeId: 'roadmap'
  });
}

export function createMarker(map, title, position) {
  const icon = {
    url: "https://maps.gstatic.com/mapfiles/place_api/icons/geocode-71.png",
    size: new google.maps.Size(71, 71),
    origin: new google.maps.Point(0, 0),
    anchor: new google.maps.Point(17, 34),
    scaledSize: new google.maps.Size(25, 25)
  };

  return new google.maps.Marker({
    map: map,
    icon: icon,
    title,
    position,
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

