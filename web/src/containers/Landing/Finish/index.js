import React from 'react'
import { useSelector } from 'react-redux'

function Finish() {
  const needs = useSelector(state => state.landing.needs)
  const address = useSelector(state => state.landing.address)

  return (
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <h1>Confirm</h1>

          <h2>Your status</h2>
          <p>You need help</p>

          <h2>Your needs</h2>
          <p style={{whiteSpace: "pre"}}>{needs}</p>

          <h2>Your location</h2>
          <p>{address}</p>

          <button type="button" className="btn btn-outline-primary btn-lg">Confirm</button>
        </div>
      </div>
    </div>
  )
}

export default Finish
