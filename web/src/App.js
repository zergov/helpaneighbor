import React from 'react';
import { BrowserRouter as Router } from "react-router-dom";

import Routes from './routes'

function App() {
  return (
    <main>
      <Router>
        <Routes />
      </Router>
    </main>
  );
}

export default App;
