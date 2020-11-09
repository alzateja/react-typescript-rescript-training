export interface Product {
  id: string;
  name: string;
  // This question mark denotes optional properties
  description?: string;
  price: number;
  quantity: number;
}

// We will also define a type alias for Product List since we will most likely reuse
export type ProductList = Product[];
