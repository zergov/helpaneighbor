import React, { useState } from 'react'
import PlacesAutocomplete, {
  geocodeByAddress,
  getLatLng,
} from 'react-places-autocomplete';

function LocationSearchInput(props) {
  const [address, setAddress] = useState('')

  function handleChange(address) {
    setAddress(address)
  }

  async function handleSelect(address) {
    const results = await geocodeByAddress(address)
    const geocode = results[0]
    const latLng = await getLatLng(geocode)

    setAddress(geocode.formatted_address)

    if (props.onSelect) {
      props.onSelect({ ...geocode, ...latLng })
    }
  }

  return (
    <PlacesAutocomplete
      value={address}
      onChange={handleChange}
      onSelect={handleSelect}
    >
      {({ getInputProps, suggestions, getSuggestionItemProps, loading }) => (
        <div className="form-group">
          <input
            {...getInputProps({
              placeholder: 'Search Places ...',
              className: 'location-search-input form-control',
            })}
          />
          <div className="autocomplete-dropdown-container">
            {loading && <div>Loading...</div>}
            {suggestions.map(suggestion => {
              const className = suggestion.active
                ? 'suggestion-item--active'
                : 'suggestion-item';
              const style = suggestion.active
                ? { backgroundColor: '#fafafa', cursor: 'pointer' }
                : { backgroundColor: '#ffffff', cursor: 'pointer' };
              return (
                <div
                  {...getSuggestionItemProps(suggestion, {
                    className,
                    style,
                  })}
                >
                  <span>{suggestion.description}</span>
                </div>
              );
            })}
          </div>
        </div>
      )}
    </PlacesAutocomplete>
  );
}

export default LocationSearchInput
