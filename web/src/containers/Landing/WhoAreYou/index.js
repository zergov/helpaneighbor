import React from 'react'

function Landing() {
  return (
    <div className="container"style={{ height: "100vh" }}>
      <div className="row h-100">
        <div className="col-sm-12 my-auto">
          <h1 className="text-center">Who are you?</h1>
          <button type="button" className="btn btn-outline-primary btn-lg btn-block">Someone seeking for help</button>
          <button type="button" className="btn btn-outline-primary btn-lg btn-block">Someone wanting to help</button>
        </div>
      </div>
    </div>
  )
}

export default Landing
