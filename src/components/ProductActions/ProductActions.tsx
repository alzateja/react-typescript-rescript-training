import React from "react";
import IconButton from "@material-ui/core/IconButton";
import DeleteIcon from "@material-ui/icons/Delete";
import AddShoppingCartIcon from "@material-ui/icons/AddShoppingCart";

interface ProductActionsProps {
  deleteFromCartResetField: () => void;
  updateCartResetField: () => void;
}

const ProductActions = ({
  deleteFromCartResetField,
  updateCartResetField,
}: ProductActionsProps): JSX.Element => (
  <>
    <IconButton
      color="primary"
      aria-label="add to shopping cart"
      onClick={updateCartResetField}
    >
      <AddShoppingCartIcon />
    </IconButton>
    <IconButton aria-label="delete" onClick={deleteFromCartResetField}>
      <DeleteIcon />
    </IconButton>
  </>
);

export default ProductActions;
