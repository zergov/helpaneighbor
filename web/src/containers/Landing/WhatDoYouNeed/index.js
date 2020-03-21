import React, { useState } from 'react'
import { useHistory } from 'react-router-dom';
import { useDispatch } from 'react-redux'

function WhatDoYouNeed() {
  const [needs, setNeeds] = useState("")
  const dispatch = useDispatch()
  const history = useHistory()

  function confirmNeeds() {
    dispatch({ type: "LANDING_SET_NEEDS", needs })
    history.push("/landing/where-are-you")
  }

  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1>What do you need?</h1>
          <div className="form-group">
            <textarea className="form-control" rows="5" onChange={e => setNeeds(e.target.value)} value={needs}></textarea>
          </div>
          <button type="button" onClick={confirmNeeds} className="btn btn-outline-primary btn-lg btn-block">Next</button>
        </div>
      </div>
    </div>
  )
}

export default WhatDoYouNeed
