import React from "react"
import {
  Switch,
  Route,
} from "react-router-dom";

import Home from './containers/Home'
import WhoAreYou from './containers/Landing/WhoAreYou'
import WhatDoYouNeed from './containers/Landing/WhatDoYouNeed'
import WhereAreYou from './containers/Landing/WhereAreYou'

function Routes() {
  return (
    <Switch>
      <Route exact path="/">
        <Home />
      </Route>
      <Route exact path="/landing/who-are-you">
        <WhoAreYou />
      </Route>
      <Route exact path="/landing/what-do-you-need">
        <WhatDoYouNeed />
      </Route>
      <Route exact path="/landing/where-are-you">
        <WhereAreYou />
      </Route>
    </Switch>
  )
}


export default Routes
