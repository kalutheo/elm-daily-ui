import React, { Component } from 'react';
import {connect} from 'react-redux';

import './App.css';

// Fork : http://codepen.io/qq7886/pen/zBGrwq

class App extends Component {

  handleAddToCart = () => {
    this.props.dispatch({type: 'Cart', action: {
      type: 'AddToCart',
      productId: 1
    }})
  }

  render() {
    return (
      <div className="App">
        <div id="container">
          <div className="box">
            <img src="http://chenyiya.com/codepen/product-1.jpg" alt="pic1" />
            <i className="fa fa-plus" onClick={this.handleAddToCart} data-id="1"/>
            <h3 id="item-one">Beer Bottle</h3>
            <p>12.99</p>
          </div>
          <div className="box">
            <img src="http://chenyiya.com/codepen/product-2.jpg" alt="pic2" />
            <i className="fa fa-plus" onClick={this.handleAddToCart} data-id="2"/>
            <h3 id="item-two">Eco Bag</h3>
            <p>45.99</p>
          </div>
          <div className="box">
            <img src="http://chenyiya.com/codepen/product-3.jpg" alt="pic3" />
            <i className="fa fa-plus" onClick={this.handleAddToCart} data-id="3"/>
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

export default connect()(App)
