import React from 'react';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom'
import WorkOutList from './components/WorkOutList'
import ViewWorkOut from './components/ViewWorkOut'
import CreateWorkOut from './components/CreateWorkOut'

const App = () => {
  return(
    <Router>
      <div className = "container">
        <Link to="/">View all Workouts</Link>
        <Link to="/create">Add Workout</Link>
      </div>
      <Route exact path="/" component={WorkOutList} />
      <Route exact path="/:id" exact component={ViewWorkOut} />
      <Route exact path="/create" exact component={CreateWorkOut} />
    </Router>
  )
}

export default App;
