import React, { useState } from 'react'
import { useHistory } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux'
import GoogleMapReact from 'google-map-react';
import { Redirect } from 'react-router-dom';

function ConfirmLocation() {
  const coords = useSelector(state => state.landing.coords)
  const address = useSelector(state => state.landing.address)
  const dispatch = useDispatch()
  const history = useHistory()
  const googleApiKey = "AIzaSyA1E-jEgtdh_zQX2kHR3arevxr1mnk5TSU"

  function yes() {
    window.alert("done!")
  }

  function no() {
    history.push("/landing/where-are-you")
  }

  if (coords == null || address == null) {
    return <Redirect to={{ pathname: '/landing/where-are-you' }} />
  }

  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1>Confirm where you live</h1>
          <p>{ address }</p>
          <div style={{ height: '300px', width: '100%', margin: 4 }}>
            <GoogleMapReact
              bootstrapURLKeys={{ key: googleApiKey }}
              center={coords}
              zoom={15}
            >
              <div lat={coords.lat} lng={coords.lng}>You</div>
            </GoogleMapReact>
          </div>
          <div>
            <button type="button" onClick={yes} className="btn btn-outline-primary btn-lg btn-block">Yes, this is where I live</button>
            <button type="button" onClick={no} className="btn btn-outline-primary btn-lg btn-block">No, I don't live there</button>
          </div>
        </div>
      </div>
    </div>
  )
}

export default ConfirmLocation
