import React, { useState } from 'react'
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux'

function WhereAreYou() {
  const [location, setLocation] = useState(null)
  const dispatch = useDispatch()
  const history = useHistory()

  function confirmLocation() {
    dispatch({ type: "LANDING_SET_LOCATION", location })
  }

  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1 className="text-center">Where are you?</h1>
          <p className="text-center">Your location, and what you need, will appear to anyone near you that wants to help.</p>
        </div>
      </div>
    </div>
  )
}

export default WhereAreYou
