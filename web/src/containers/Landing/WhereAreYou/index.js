import React, { useState } from 'react'
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux'
import GoogleMapReact from 'google-map-react';

import LocationSearchInput from '../../../components/LocationSearchInput'

function WhereAreYou() {
  const [location, setLocation] = useState(null)
  const dispatch = useDispatch()
  const history = useHistory()
  const googleApiKey = "AIzaSyA1E-jEgtdh_zQX2kHR3arevxr1mnk5TSU"

  function confirmLocation() {
    dispatch({ type: "LANDING_SET_LOCATION", location })
  }

  async function onAddressSelection({lat, lng}) {
    setLocation({lat, lng})
  }

  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1 className="text-center">Where are you?</h1>
          <p className="text-center">Your location, and what you need, will appear to anyone near you that wants to help.</p>
          <LocationSearchInput onSelect={onAddressSelection}/>
          { location && (
            <>
            <p>you live: {location.lat}, {location.lng}</p>
            <div style={{ height: '400px', width: '100%' }}>
              <GoogleMapReact
                bootstrapURLKeys={{ key: googleApiKey }}
                defaultCenter={location}
                defaultZoom={15}
              >
                <div lat={location.lat} lng={location.lng}>You</div>
              </GoogleMapReact>
            </div>
            </>
          )}
        </div>
      </div>
    </div>
  )
}

export default WhereAreYou
