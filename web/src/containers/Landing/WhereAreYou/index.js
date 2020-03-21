import React, { useState } from 'react'
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux'
import GoogleMapReact from 'google-map-react';

import LocationSearchInput from '../../../components/LocationSearchInput'

function WhereAreYou() {
  const [location, setLocation] = useState(null)
  const [address, setAddress] = useState(null)
  const dispatch = useDispatch()
  const history = useHistory()
  const googleApiKey = "AIzaSyA1E-jEgtdh_zQX2kHR3arevxr1mnk5TSU"

  async function onAddressSelection(payload) {
    const {lat, lng, formatted_address} = payload
    dispatch({ type: "LANDING_SET_COORDS", coords: {lat, lng} })
    dispatch({ type: "LANDING_SET_ADDRESS", address: formatted_address })
    history.push("/landing/confirm-location")
  }

  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1 className="text-center">Where are you?</h1>
          <p className="text-center lead">Your location, and what you need, will appear to anyone near you that wants to help.</p>
          <LocationSearchInput onSelect={onAddressSelection}/>
          { location && (
            <div>
              <p className="text-center lead">Is this where you live?</p>
              <div style={{ height: '300px', width: '100%' }}>
                <GoogleMapReact
                  bootstrapURLKeys={{ key: googleApiKey }}
                  center={location}
                  zoom={15}
                >
                  <div lat={location.lat} lng={location.lng}>You</div>
                </GoogleMapReact>
              </div>
            </div>
          )}
        </div>
      </div>
    </div>
  )
}

export default WhereAreYou
