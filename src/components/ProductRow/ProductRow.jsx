import React, { useState } from "react";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import TextField from "@material-ui/core/TextField";
import ProductActions from "../ProductActions/";

const ProductRow = ({
  name,
  description,
  quantity,
  price,
  id,
  deleteFromCart,
  updateCart,
}) => {
  const [newProductTotal, setNewProductTotal] = useState("");
  return (
    <TableRow key={name}>
      <TableCell component="th" scope="row">
        <strong>{name}</strong>
        {description && `: ${description}`}
      </TableCell>
      <TableCell align="right">{price}</TableCell>
      <TableCell align="right">{quantity}</TableCell>
      <TableCell align="right">
        <TextField
          id="standard-basic"
          value={newProductTotal}
          label="New Quantity"
          onChange={(e) => setNewProductTotal(e.target.value)}
        />
      </TableCell>
      <TableCell align="right">
        <ProductActions
          deleteFromCartResetField={() => {
            setNewProductTotal("");
            deleteFromCart(id);
          }}
          updateCartResetField={() => {
            setNewProductTotal("");
            updateCart(id, newProductTotal);
          }}
        />
      </TableCell>
    </TableRow>
  );
};

export default ProductRow;
