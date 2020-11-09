import { findIndex, get, reduce, matches } from "lodash";
import { Product, ProductList } from "../types";

// We can now type our functions.
// This function should takes a product and calculates the price based on the price and quantity.
// It should return a numeric value
export const calculateProductPrice = (product: Product): number =>
  get(product, "quantity") * get(product, "price");

export const calculateTotalPrice = (
  cart: ProductList,
  initialTotal: number
): number =>
  reduce(
    cart,
    (result, product) => {
      result += calculateProductPrice(product);
      return result;
    },
    initialTotal
  );

export const findIndexAndUpdateQuantity = (
  cart: ProductList,
  id: string,
  quantity: number
): ProductList => {
  const productIndex = findIndex(cart, matches({ id }));
  const updateProduct = (product, index) =>
    index === productIndex ? { ...product, quantity } : { ...product };
  return cart.map(updateProduct);
};
