import React, { useState } from "react";
import "./index.css";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
import Card from "@material-ui/core/Card";
import Container from "@material-ui/core/Container";
import ProductTable from "../ProductTable/";
import { initialProductListWithTypeErrors } from "../../utils/mock";
import {
  calculateTotalPrice,
  findIndexAndUpdateQuantity,
} from "../../utils/cart";

const App = () => {
  const initialCartValue = "0";
  const [cart, setCart] = useState(initialProductListWithTypeErrors);
  const [calculatedPrice, setCalculatedPrice] = useState(initialCartValue);

  const deleteFromCart = (id) => {
    const updatedCart = findIndexAndUpdateQuantity(cart, id, 0);
    return setCart(updatedCart);
  };

  const updateCart = (id, value) => {
    const updatedCart = findIndexAndUpdateQuantity(cart, id, value);
    return setCart(updatedCart);
  };

  const calculatePrice = () => {
    const totalPrice = calculateTotalPrice(cart, initialCartValue);
    setCalculatedPrice(totalPrice);
  };

  return (
    <>
      <Typography align="center" variant="h3">
        Welcome to the React Type Demo App
      </Typography>
      <Typography align="center" variant="body1">
        Here you can buy some items for your team
      </Typography>

      <Container>
        <ProductTable
          cart={cart}
          deleteFromCart={deleteFromCart}
          updateCart={updateCart}
        />

        <Card className="shopping-cart">
          <Button variant="contained" color="primary" onClick={calculatePrice}>
            Calculate Price
          </Button>

          <h3>Your total is</h3>
          <h3>{calculatedPrice}</h3>
        </Card>
      </Container>
    </>
  );
};

export default App;
