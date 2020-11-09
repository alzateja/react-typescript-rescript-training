import React from "react";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";
import ProductRow from "../ProductRow/";
import "./index.css";

const ProductTable = ({ cart, deleteFromCart, updateCart }) => {
  return (
    <TableContainer component={Paper} className="product-table">
      <Table aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Product Name</TableCell>
            <TableCell align="right">Price</TableCell>
            <TableCell align="right">Current Quantity</TableCell>
            <TableCell align="right">New Quantity</TableCell>
            <TableCell align="right">Actions</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {cart.map((product) => {
            return (
              <ProductRow
                {...product}
                deleteFromCart={deleteFromCart}
                updateCart={updateCart}
                key={product.id}
              />
            );
          })}
        </TableBody>
      </Table>
    </TableContainer>
  );
};

export default ProductTable;
