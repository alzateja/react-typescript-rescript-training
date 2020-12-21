// We open Product to type our array and import our productDetails list
open Product

// We import the ProductTable component
module ProductTable ={
     @bs.module("../ProductTable/ProductTable.jsx") @react.component
  external make: (
    //   We type our cart as an array of type product from Product
    ~cart: array<product>,
    // deleteFromCart and updateCart returns unit (or ()) since they do not return a value but instead invoke a function
    ~deleteFromCart: string => unit,
    ~updateCart: (string, int) => unit,
  ) => React.element = "default"
}

// Always use the react.component decorator
@react.component
let make = () => {
// We open MaterialUi to avoid prefacing all the components
    open MaterialUi
//   we must set our initialCarValue to a float.
  let initialCartValue = 0.0
/*
The useState syntax is different in Reason react.
our syntax on the left of the "=" is a tuple.
On the right side of the equal, our useState does not take a value,
but a function that returns a value.
The _ means the argument is not used
*/
  let (cart, setCart) = React.useState(_ => productDetails)
  let (calculatedPrice, setCalculatedPrice) = React.useState(
      _ => initialCartValue
      )

  let deleteFromCart = id => {
    //   We can import our CartUtils files now
    let updatedCart = CartUtils.findIndexAndUpdateQuantity(cart, id, 0)
    // Our setState functions also take a function that returns a value
    setCart(_=> updatedCart)
  }

  let updateCart = (id, value) => {
    let updatedCart = CartUtils.findIndexAndUpdateQuantity(cart, id, value)
    setCart(_ => updatedCart)
  }

  let calculatePrice = () => {
    let totalPrice = CartUtils.calculateTotalPrice(cart, initialCartValue)
    setCalculatedPrice(_ => totalPrice)
  }

  <>
    <Typography align=#Center variant=#H3>
    // We can use the arrow function even with the React render functions
      {"Welcome to the React Type Demo App"->React.string}
    </Typography>
    <Typography align=#Center variant=#Body1>
      {"Here you can buy some items for your team"->React.string}
    </Typography>
    <Container>
      <ProductTable
      cart={cart}
      deleteFromCart={deleteFromCart}
      updateCart={updateCart}
      />
      <Card className="shopping-cart">
        <Button variant=#Contained color=#Primary onClick={_ => calculatePrice()}>
          {"Calculate Price"->React.string}
        </Button>
        <h3> {"Your total is"->React.string} </h3>
 // This chain allows us to change a float to a string with 2 decimal points.
        <h3>
        {calculatedPrice
        ->Js.Float.toFixedWithPrecision(~digits=2)
        ->React.string
        }
        </h3>
      </Card>
    </Container>
  </>
}
