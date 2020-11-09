import { findIndex, get, reduce, matches } from "lodash";

export const calculateProductPrice = (product) =>
  get(product, "quantity") * get(product, "price");

export const calculateTotalPrice = (cart, initialTotal) =>
  reduce(
    cart,
    (result, product) => {
      result += calculateProductPrice(product);
      return result;
    },
    initialTotal
  );

export const findIndexAndUpdateQuantity = (cart, id, quantity) => {
  const productIndex = findIndex(cart, matches({ id }));
  const updateProduct = (product, index) =>
    index === productIndex ? { ...product, quantity } : { ...product };
  return cart.map(updateProduct);
};
