import React from 'react'
import { useHistory } from 'react-router-dom';
import { useState, useDispatch } from 'react-redux'

function WhoAreYou() {
  const dispatch = useDispatch()
  const history = useHistory()

  function setUserType(userType) {
    dispatch({ type: "LANDING_SET_USER_TYPE", userType })
    if (userType == "unsafe")
      history.push("/landing/what-do-you-need")
  }

  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1>What is your situation?</h1>
          <button type="button" onClick={() => setUserType("unsafe")} className="btn btn-outline-primary btn-lg btn-block">I need help</button>
          <button type="button" onClick={() => setUserType("safe")} className="btn btn-outline-primary btn-lg btn-block">I want to help</button>
        </div>
      </div>
    </div>
  )
}

export default WhoAreYou
