import React from 'react';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom'
import { render } from 'react-dom';
import WorkOutList from './components/WorkOutList'
import ViewWorkOut from './components/ViewWorkOut'
import CreateWorkOut from './components/CreateWorkOut'

const App = () => {
  return(
    <Router>
      <div className = "container">
        <h2>Fitness App</h2>
      </div>
      <Route exact path="/" component={WorkOutList} />
      <Route exact path="/:id" component={ViewWorkOut} />
      <Route exact path="/create" component={CreateWorkOut} />
    </Router>
  )
}

export default App;
