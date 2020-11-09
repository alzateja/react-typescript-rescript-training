import { productDetails } from "../constants/product";
import { defaultProductQuantities } from "../constants/mock";

export const initialProductListWithTypeErrors = productDetails.map(
  (product) => ({
    ...product,
    quantity: defaultProductQuantities[product.id] || 0,
  })
);
