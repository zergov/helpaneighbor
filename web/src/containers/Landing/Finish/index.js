import React from 'react'
import { useSelector } from 'react-redux'

function Finish() {
  const needs = useSelector(state => state.landing.needs)
  const address = useSelector(state => state.landing.address)

  return (
    <div className="container">
      <div className="row">
        <div className="col-sm-12">
          <h1>Confirm your information</h1>

          <h5>Your status</h5>
          <p>You need help</p>

          <h5>What you need</h5>
          <p style={{whiteSpace: "pre"}}>{needs}</p>

          <h5>Your location</h5>
          <p>{address}</p>

          <button type="button" className="btn btn-outline-primary btn-lg">Confirm</button>
        </div>
      </div>
    </div>
  )
}

export default Finish
