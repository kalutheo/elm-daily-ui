import React from 'react';
import ReactDOM from 'react-dom';

// Components.
import App from './App';

// Others.
import './index.css';

// Redux.
import { createStore, applyMiddleware, compose, combineReducers } from 'redux';
import { Provider } from 'react-redux';
import { reducer as elmReducer } from 'redux-elm-middleware'

// Redux Elm middleware.
import createElmMiddleware from 'redux-elm-middleware';
const elmStore = elmApp.Reducer.worker();
const { run, elmMiddleware } = createElmMiddleware(elmStore)
import elmApp from './Reducer.elm';


function reducer(state = 0, action) {
  switch (action.type) {
  case 'INCREMENT':
    return state + 1
  case 'DECREMENT':
    return state - 1
  default:
    return state
  }
}


// Configure Store / Middleware.
const composeEnhancers = window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
const middleware = [elmMiddleware];
const store = createStore(combineReducers({
  counter: reducer,
  elm: elmReducer
}), {
  counter: 0
}, composeEnhancers(
  applyMiddleware(...middleware)
));
run(store);

// Render App.
ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>
  ,
  document.getElementById('root')
);
