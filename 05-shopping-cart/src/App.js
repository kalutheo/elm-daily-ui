import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render() {
    return (
      <div className="App">
        <div id="container">
          <div className="box">
            <img src="http://chenyiya.com/codepen/product-1.jpg" alt="pic1" />
            <i className="fa fa-plus" />
            <h3 id="item-one">Beer Bottle</h3>
            <p>12.99</p>
          </div>
          <div className="box">
            <img src="http://chenyiya.com/codepen/product-2.jpg" alt="pic2" />
            <i className="fa fa-plus" />
            <h3 id="item-two">Eco Bag</h3>
            <p>45.99</p>
          </div>
          <div className="box">
            <img src="http://chenyiya.com/codepen/product-3.jpg" alt="pic3" />
            <i className="fa fa-plus" />
            <h3 id="item-three">Paper Bag</h3>
            <p>58.99</p>
          </div>
          <div id="cart">
            <div id="head">
              <h3>Shopping Cart</h3>
              <div id="price">Price</div>
              <div id="quantity">Quantity</div>
              <div id="total">Total</div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default App;
