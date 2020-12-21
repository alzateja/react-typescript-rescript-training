// We open the Product module to access the Product type
open Product
// We also can open the Belt library to make our code more readable.
open Belt
// Our first try at writing a function.
let calculateProductPrice = (product) => {
    // We must wrap our values in Some to make them an option.
    // We also have to convert our int to float.
    let quantity = product.quantity -> Some -> Option.getWithDefault(0) -> Int.toFloat
    let price = product.price -> Some -> Option.getWithDefault(0.0)
  price *. quantity
}

let combinePriceCalculations = (balance, product) => balance +. calculateProductPrice(product)

let calculateTotalPrice = (cart, initialCartValue) =>
    // We are using the Belt.Array library since we open. There is also a JS.Array as well
    Array.reduce(cart, initialCartValue, combinePriceCalculations)


let evaluateProductQuantity = (id, updatedQuantity, product) => {
    // ReScript also supports ternaries
  product.id === id && product.quantity !== updatedQuantity
    ? {...product, quantity: updatedQuantity}
    : product
}

let findIndexAndUpdateQuantity = (cart, id, quantity) => {
  let evaluateProduct = evaluateProductQuantity(id)(quantity)
    // We are using the Belt.Array library since we open. There is also a JS.Array as well
    Array.map(cart, evaluateProduct)
}
