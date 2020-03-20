import React from 'react'
import { Redirect } from 'react-router-dom';

function Home() {
  return (
    <Redirect to={{ pathname: '/landing/who-are-you' }} />
  )
}

export default Home
