import React from "react"
import {
  Switch,
  Route,
} from "react-router-dom";

import Home from './containers/Home'
import WhoAreYou from './containers/Landing/WhoAreYou'

function Routes() {
  return (
    <Switch>
      <Route exact path="/">
        <Home />
      </Route>
      <Route exact path="/landing/who-are-you">
        <WhoAreYou />
      </Route>
    </Switch>
  )
}


export default Routes
