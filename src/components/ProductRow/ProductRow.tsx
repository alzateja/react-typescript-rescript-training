import React, { useState } from "react";
import TableCell from "@material-ui/core/TableCell";
import TableRow from "@material-ui/core/TableRow";
import TextField from "@material-ui/core/TextField";
import ProductActions from "../ProductActions/";
import {
  Product,
  DeleteFromCartFunction,
  UpdateCartFunction,
} from "../../types";

// One additional feature we can do is extend a type.
// Since ProductRow has mostly the same props as Product, we can extend that type and additional values..
interface ProductRowProps extends Product {
  deleteFromCart: DeleteFromCartFunction;
  updateCart: UpdateCartFunction;
}

const ProductRow = ({
  name,
  description,
  quantity,
  price,
  id,
  deleteFromCart,
  updateCart,
}: ProductRowProps): JSX.Element => {
  const [newProductTotal, setNewProductTotal] = useState<number>(quantity);
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
          type="number"
          onChange={
            //We can type the change event as well.
            (e: React.ChangeEvent<HTMLInputElement>): void => {
              const inputAsNumber = parseInt(e.target.value);
              setNewProductTotal(inputAsNumber);
            }
          }
        />
      </TableCell>
      <TableCell align="right">
        <ProductActions
          deleteFromCartResetField={(): void => {
            setNewProductTotal(0);
            deleteFromCart(id);
          }}
          updateCartResetField={(): void => {
            setNewProductTotal(0);
            updateCart(id, newProductTotal);
          }}
        />
      </TableCell>
    </TableRow>
  );
};

export default ProductRow;
