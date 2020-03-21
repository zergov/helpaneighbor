import React, { useState } from 'react'
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux'
import GoogleMapReact from 'google-map-react';

import LocationSearchInput from '../../../components/LocationSearchInput'

function WhereAreYou() {
  const dispatch = useDispatch()
  const history = useHistory()

  async function onAddressSelection(payload) {
    const {lat, lng, formatted_address} = payload
    dispatch({ type: "LANDING_SET_COORDS", coords: {lat, lng} })
    dispatch({ type: "LANDING_SET_ADDRESS", address: formatted_address })
    history.push("/landing/confirm-location")
  }

  return (
    <div className="container" style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1>Where are you?</h1>
          <LocationSearchInput onSelect={onAddressSelection}/>
        </div>
      </div>
    </div>
  )
}

export default WhereAreYou
